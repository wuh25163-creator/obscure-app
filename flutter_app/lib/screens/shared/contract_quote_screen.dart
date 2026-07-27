import 'package:flutter/material.dart';
import '../../core/app_text.dart';
import '../../core/app_theme.dart';

class ContractQuoteScreen extends StatelessWidget {
  const ContractQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: const ObscureAppBar(), // Using ObscureAppBar from app_theme
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 16, 15, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hero Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.accentRed,
                  border: Border.all(color: AppTheme.primary, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: AppTheme.primary,
                      offset: AppTheme.hardShadowOffset,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      ContractQuoteText.title,
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1.03,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      ContractQuoteText.description,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Colors.white,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primary, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: AppTheme.primary,
                      offset: AppTheme.hardShadowOffset,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      ContractQuoteText.statusLabel,
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                    const Text(
                      ContractQuoteText.statusValue,
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 29,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.accentRed,
                        letterSpacing: 0,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.only(top: 12),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: AppTheme.primary, width: 1.5),
                        ),
                      ),
                      child: const Text(
                        ContractQuoteText.date,
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Terms of Engagement
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primary, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: AppTheme.primary,
                      offset: AppTheme.hardShadowOffset,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppTheme.primary,
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: const Text(
                        ContractQuoteText.termsTitle,
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTermItem(
                      ContractQuoteText.terms[0].title,
                      ContractQuoteText.terms[0].detail,
                    ),
                    const SizedBox(height: 16),
                    _buildTermItem(
                      ContractQuoteText.terms[1].title,
                      ContractQuoteText.terms[1].detail,
                    ),
                    const SizedBox(height: 16),
                    _buildTermItem(
                      ContractQuoteText.terms[2].title,
                      ContractQuoteText.terms[2].detail,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Fee Breakdown
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primary, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: AppTheme.primary,
                      offset: AppTheme.hardShadowOffset,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppTheme.primary,
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: const Text(
                        ContractQuoteText.feeTitle,
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    _buildFeeItem(
                      ContractQuoteText.fees[0].title,
                      ContractQuoteText.fees[0].detail,
                    ),
                    const SizedBox(height: 12),
                    _buildFeeItem(
                      ContractQuoteText.fees[1].title,
                      ContractQuoteText.fees[1].detail,
                    ),
                    const SizedBox(height: 12),
                    _buildFeeItem(
                      ContractQuoteText.fees[2].title,
                      ContractQuoteText.fees[2].detail,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: AppTheme.primary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(
                            child: Text(
                              ContractQuoteText.total,
                              style: TextStyle(
                                fontFamily: 'Space Grotesk',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Text(
                            '\$ 14,700',
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Signature Area
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.accentYellow,
                  border: Border.all(color: AppTheme.primary, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: AppTheme.primary,
                      offset: AppTheme.hardShadowOffset,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ContractQuoteText.signature,
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 80,
                            alignment: Alignment.bottomLeft,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppTheme.primary,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                ContractQuoteText.signatureHint,
                                style: TextStyle(
                                  fontFamily: 'Space Grotesk',
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  color: AppTheme.primary.withValues(
                                    alpha: 0.4,
                                  ),
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            ContractQuoteText.consent,
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        color: AppTheme.primary,
                        alignment: Alignment.center,
                        child: const Text(
                          ContractQuoteText.sign,
                          style: TextStyle(
                            fontFamily: 'Space Grotesk',
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: AppTheme.primary,
                              width: 1.5,
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          ContractQuoteText.downloadPdf,
                          style: TextStyle(
                            fontFamily: 'Space Grotesk',
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: AppTheme.primary,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermItem(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppTheme.accentBlue,
            border: Border.all(color: AppTheme.primary, width: 1.5),
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeeItem(String phase, String amount) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppTheme.primary,
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ), // Using solid since dotted is trickier without custom painter
      ),
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              phase,
              style: const TextStyle(
                fontFamily: 'Space Grotesk',
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontFamily: 'Space Grotesk',
              fontSize: 17,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
