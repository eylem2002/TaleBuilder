import 'package:flutter/material.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => TermsScreenState();
}

class TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: ThemeManager.background,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: LayoutManager.widthNHeight0(context, 1) * 0.1),
                child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: ThemeManager.textColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Welcome to TaleBuilder. By accessing or using our platform, you agree to comply with and be bound by the following terms and conditions. Please review them carefully.',
                          style: TextStyle(
                            color: ThemeManager.second,
                            fontWeight: FontWeight.bold,
                            fontFamily: ThemeManager.fontFamily,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: LayoutManager.widthNHeight0(context, 1) * 0.1,
              ),
              _buildTermsSection(context, 'Acceptance of Terms',
                  'By using TaleBuilder, you agree to these terms of use. If you do not agree, do not use our platform.'),
              SizedBox(
                height: LayoutManager.widthNHeight0(context, 1) * 0.1,
              ),
              _buildTermsSection(context, 'Service Description',
                  'At TaleBuilder, we transform complex data findings into compelling narrative stories, enabling data scientists and analysts to communicate their results effectively to stakeholders. Our AI-driven tool simplifies the storytelling process, ensuring clarity and understanding.'),
              SizedBox(
                height: LayoutManager.widthNHeight0(context, 1) * 0.1,
              ),
              _buildTermsSection(context, 'User Responsibilities',
                  'Users are responsible for the content they upload and must ensure it complies with all applicable laws and regulations. You agree not to use TaleBuilder for any unlawful or prohibited activities.'),
              SizedBox(
                height: LayoutManager.widthNHeight0(context, 1) * 0.1,
              ),
              _buildTermsSection(context, 'Intellectual Property',
                  'All content and services provided by TaleBuilder are the intellectual property of TaleBuilder and its licensors. You agree not to reproduce, distribute, or create derivative works without explicit permission.'),
              SizedBox(
                height: LayoutManager.widthNHeight0(context, 1) * 0.1,
              ),
              _buildTermsSection(context, 'Privacy',
                  'Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and protect your information.'),
              SizedBox(
                height: LayoutManager.widthNHeight0(context, 1) * 0.1,
              ),
              _buildTermsSection(context, 'Limitation of Liability',
                  'TaleBuilder is provided "as is" without any warranties, express or implied. We do not guarantee that the service will be error-free or uninterrupted. TaleBuilder is not liable for any damages arising from the use or inability to use our platform.'),
              SizedBox(
                height: LayoutManager.widthNHeight0(context, 1) * 0.1,
              ),
              _buildTermsSection(context, 'Modifications to Terms',
                  'We reserve the right to modify these terms at any time. Your continued use of TaleBuilder constitutes acceptance of any changes.'),
              SizedBox(
                height: LayoutManager.widthNHeight0(context, 1) * 0.1,
              ),
              _buildTermsSection(context, 'Termination',
                  'We reserve the right to terminate or suspend access to TaleBuilder without notice for conduct that we believe violates these terms or is harmful to other users of the platform.'),
              SizedBox(
                height: LayoutManager.widthNHeight0(context, 1) * 0.1,
              ),
              _buildTermsSection(context, 'Governing Law',
                  'These terms are governed by the laws of the jurisdiction in which TaleBuilder operates. Any disputes will be resolved in the appropriate courts of that jurisdiction.'),
              SizedBox(
                height: LayoutManager.widthNHeight0(context, 1) * 0.1,
              ),
              _buildTermsSection(context, 'Contact Information',
                  'For any questions or concerns regarding these terms, please contact us at [contact information].'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermsSection(
      BuildContext context, String title, String content) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: ThemeManager.textColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: ThemeManager.second,
              fontWeight: FontWeight.bold,
              fontSize: LayoutManager.widthNHeight0(context, 1) * 0.035,
              fontFamily: ThemeManager.fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: LayoutManager.widthNHeight0(context, 1) * 0.03,
          ),
          Text(
            content,
            style: TextStyle(
              color: ThemeManager.second,
              fontWeight: FontWeight.bold,
              fontFamily: ThemeManager.fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
