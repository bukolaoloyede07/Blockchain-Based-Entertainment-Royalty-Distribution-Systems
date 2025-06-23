# Blockchain-Based Entertainment Royalty Distribution System

A comprehensive smart contract system built on Stacks blockchain using Clarity for managing entertainment content royalties with full transparency and automated distribution.

## 🎯 Overview

This system provides a complete solution for entertainment industry royalty management, featuring:

- **Rights Holder Verification**: Secure registration and verification of content rights holders
- **Usage Tracking**: Real-time tracking of content consumption across platforms
- **Royalty Calculation**: Automated calculation of royalty payments based on usage and rights
- **Distribution Automation**: Automated STX payments to rights holders
- **Transparency Reporting**: Complete transparency with public and private reporting options

## 🏗️ Architecture

### Smart Contracts

1. **rights-holder-verification.clar**
    - Manages rights holder registration
    - Verifies content ownership
    - Links content to rights holders

2. **usage-tracking.clar**
    - Records content usage events
    - Tracks streams, downloads, and revenue
    - Maintains usage statistics

3. **royalty-calculation.clar**
    - Calculates royalty amounts
    - Handles platform fees
    - Provides estimation tools

4. **distribution-automation.clar**
    - Automates royalty payments
    - Manages contract funding
    - Tracks distribution status

5. **transparency-reporting.clar**
    - Generates transparency reports
    - Provides public/private reporting
    - Maintains earnings summaries

## 🚀 Getting Started

### Prerequisites

- Stacks blockchain development environment
- Clarinet CLI tool
- Node.js and npm

### Installation

\`\`\`bash
# Clone the repository
git clone <repository-url>
cd royalty-distribution-system

# Install dependencies
npm install

# Run tests
npm test
\`\`\`

### Deployment

\`\`\`bash
# Deploy to testnet
clarinet deploy --testnet

# Deploy to mainnet
clarinet deploy --mainnet
\`\`\`

## 📋 Usage

### 1. Register Rights Holder

\`\`\`clarity
(contract-call? .rights-holder-verification register-rights-holder "song-123" u2500) ;; 25% royalty
\`\`\`

### 2. Record Usage

\`\`\`clarity
(contract-call? .usage-tracking record-usage "song-123" "spotify" "stream" u1000 u50000) ;; 1000 streams, 50000 micro-STX revenue
\`\`\`

### 3. Calculate Royalties

\`\`\`clarity
(contract-call? .royalty-calculation calculate-royalties "song-123" u1) ;; Period 1
\`\`\`

### 4. Distribute Payments

\`\`\`clarity
(contract-call? .distribution-automation execute-distribution "song-123" u1)
\`\`\`

### 5. Generate Reports

\`\`\`clarity
(contract-call? .transparency-reporting generate-report "song-123" u1 true) ;; Public report
\`\`\`

## 🔧 Configuration

### Platform Fees

Default platform fee is 5%. Can be updated by contract admin:

\`\`\`clarity
(contract-call? .royalty-calculation update-platform-fee u300) ;; 3%
\`\`\`

### Contract Funding

Fund the distribution contract for automated payments:

\`\`\`clarity
(contract-call? .distribution-automation fund-contract u1000000) ;; 1 STX
\`\`\`

## 📊 Features

### Rights Management
- Secure rights holder registration
- Content ownership verification
- Flexible royalty percentage settings

### Usage Tracking
- Multi-platform support
- Real-time usage recording
- Comprehensive statistics

### Automated Calculations
- Platform fee deduction
- Accurate royalty calculations
- Estimation tools

### Transparent Distribution
- Automated STX payments
- Distribution status tracking
- Balance management

### Comprehensive Reporting
- Public transparency reports
- Private holder summaries
- System-wide statistics

## 🧪 Testing

Run the test suite:

\`\`\`bash
npm test
\`\`\`

Tests cover:
- Rights holder registration and verification
- Usage tracking and statistics
- Royalty calculations
- Distribution automation
- Transparency reporting

## 🔒 Security

- Contract owner controls for verification
- Balance checks for distributions
- Input validation throughout
- Error handling for edge cases

## 📈 Roadmap

- [ ] Multi-token support (SIP-010)
- [ ] Batch distribution processing
- [ ] Advanced reporting analytics
- [ ] Integration APIs
- [ ] Mobile app interface

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue on GitHub
- Join our Discord community
- Check the documentation wiki

---

Built with ❤️ for the entertainment industry using Stacks blockchain and Clarity smart contracts.
\`\`\`

