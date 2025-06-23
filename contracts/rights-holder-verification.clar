;; Rights Holder Verification Contract
;; Manages registration and verification of entertainment rights holders

;; Constants
(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_REGISTERED (err u101))
(define-constant ERR_NOT_FOUND (err u102))
(define-constant ERR_INVALID_PERCENTAGE (err u103))

;; Data Variables
(define-data-var next-rights-id uint u1)

;; Data Maps
(define-map rights-holders
  { rights-id: uint }
  {
    owner: principal,
    content-id: (string-ascii 64),
    royalty-percentage: uint,
    verified: bool,
    created-at: uint
  }
)

(define-map content-rights
  { content-id: (string-ascii 64) }
  { rights-id: uint }
)

(define-map verified-holders
  { holder: principal }
  { verified: bool, verified-at: uint }
)

;; Public Functions

;; Register new rights holder
(define-public (register-rights-holder (content-id (string-ascii 64)) (royalty-percentage uint))
  (let ((rights-id (var-get next-rights-id)))
    (asserts! (<= royalty-percentage u10000) ERR_INVALID_PERCENTAGE) ;; Max 100%
    (asserts! (is-none (map-get? content-rights { content-id: content-id })) ERR_ALREADY_REGISTERED)

    (map-set rights-holders
      { rights-id: rights-id }
      {
        owner: tx-sender,
        content-id: content-id,
        royalty-percentage: royalty-percentage,
        verified: false,
        created-at: block-height
      }
    )

    (map-set content-rights
      { content-id: content-id }
      { rights-id: rights-id }
    )

    (var-set next-rights-id (+ rights-id u1))
    (ok rights-id)
  )
)

;; Verify rights holder (only contract owner)
(define-public (verify-rights-holder (rights-id uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? rights-holders { rights-id: rights-id })
      rights-data
      (begin
        (map-set rights-holders
          { rights-id: rights-id }
          (merge rights-data { verified: true })
        )
        (map-set verified-holders
          { holder: (get owner rights-data) }
          { verified: true, verified-at: block-height }
        )
        (ok true)
      )
      ERR_NOT_FOUND
    )
  )
)

;; Read-only Functions

;; Get rights holder info
(define-read-only (get-rights-holder (rights-id uint))
  (map-get? rights-holders { rights-id: rights-id })
)

;; Get content rights
(define-read-only (get-content-rights (content-id (string-ascii 64)))
  (map-get? content-rights { content-id: content-id })
)

;; Check if holder is verified
(define-read-only (is-verified-holder (holder principal))
  (default-to false (get verified (map-get? verified-holders { holder: holder })))
)
