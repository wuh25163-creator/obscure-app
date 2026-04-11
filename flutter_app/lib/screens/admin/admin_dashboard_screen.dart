import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../shared/contract_quote_screen.dart'; // To reuse ObscureAppBar and ObscureBottomNavBar temporally

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ObscureAppBar(), // Shared AppBar
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('管理儀表板', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 64, fontWeight: FontWeight.w900, height: 0.85, letterSpacing: -2.0)),
                  const SizedBox(height: 16),
                  Container(
                    decoration: const BoxDecoration(border: Border(left: BorderSide(color: AppTheme.accentBlue, width: 4))),
                    padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
                    child: const Text('即時設計師指標與監控。', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.accentRed,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      shape: const RoundedRectangleBorder(side: BorderSide(color: AppTheme.primary, width: 3), borderRadius: BorderRadius.zero),
                      elevation: 0,
                    ),
                    child: const Text('匯出報表', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Overview Stats Cards
              _buildLargeStatCard('每日新增設計師', '124', '+12%', Icons.person_add, Colors.white, null),
              const SizedBox(height: 16),
              _buildTargetStatCard('總成交額', '\$2.4M', AppTheme.accentYellow, 0.8),
              const SizedBox(height: 16),
              _buildDisputeStatCard('未付款爭議', '18', AppTheme.accentRed),
              const SizedBox(height: 48),

              // Tables / Lists Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('設計師驗證', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 24, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
                  Row(
                    children: [
                      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 3)), child: const Icon(Icons.filter_list)),
                      const SizedBox(width: 8),
                      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 3)), child: const Icon(Icons.search)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),

              // Tabular List
              Container(
                decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 3)),
                child: Column(
                  children: [
                    Container(
                      color: AppTheme.primary,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('設計師', style: TextStyle(color: Colors.white, fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12)),
                          Text('操作', style: TextStyle(color: Colors.white, fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                    ),
                    _buildVerificationRow('Anton Vogler', 'Berlin, DE', AppTheme.accentBlue),
                    const Divider(color: AppTheme.primary, height: 2, thickness: 2),
                    _buildVerificationRow('Elena Rossi', 'Milan, IT', AppTheme.accentYellow),
                    const Divider(color: AppTheme.primary, height: 2, thickness: 2),
                    _buildVerificationRow('Marcus Chen', 'Tokyo, JP', Colors.grey[300]!),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // Disputes List
              const Text('爭議案件', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 32, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
              const SizedBox(height: 16),
              _buildDisputeItem('#88219', '未付服務費', '\$1,200', '設計師「K_Vance」聲稱專案「Hyperion」已完成，但客戶...', isHighPriority: true),
              const SizedBox(height: 24),
              _buildDisputeItem('#88224', '超出修改次數限制', '\$450', '客戶「Zenith」在簽署合約外要求額外修改...', isHighPriority: false),
              const SizedBox(height: 48),

              // System Health Widget
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.accentBlue,
                  border: Border.all(color: AppTheme.primary, width: 3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('系統狀態', style: TextStyle(fontFamily: 'Space Grotesk', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(width: 12, height: 12, decoration: const BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle)),
                        const SizedBox(width: 8),
                        const Text('所有節點正常運行', style: TextStyle(fontFamily: 'Inter', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildHealthStat('CPU 負載', '22%')),
                        Expanded(child: _buildHealthStat('延遲', '14ms')),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ObscureBottomNavBar(currentIndex: 4),
    );
  }

  Widget _buildLargeStatCard(String title, String mainValue, String subValue, IconData icon, Color bgColor, Color? borderColor) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor ?? AppTheme.primary, width: 3),
        boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(6, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
              Icon(icon, size: 32),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(mainValue, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 64, fontWeight: FontWeight.w900, letterSpacing: -2.0, height: 1.0)),
              const SizedBox(width: 16),
              Text(subValue, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.accentBlue)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTargetStatCard(String title, String mainValue, Color bgColor, double progress) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: AppTheme.primary, width: 3),
        boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(6, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          Text(mainValue, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 48, fontWeight: FontWeight.w900, height: 1.0)),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.only(top: 16),
            decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppTheme.primary, width: 2))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('目標：\$3.0M', style: TextStyle(fontFamily: 'Inter', fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  height: 24,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white, border: Border.all(color: AppTheme.primary, width: 2)),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress,
                    child: Container(color: AppTheme.accentBlue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisputeStatCard(String title, String mainValue, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: AppTheme.primary, width: 3),
        boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(6, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white)),
          const SizedBox(height: 8),
          Text(mainValue, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 64, fontWeight: FontWeight.w900, color: Colors.white, height: 1.0)),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            alignment: Alignment.center,
            child: const Text('立即審核', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 14, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationRow(String name, String location, Color avatarBg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 40, height: 40, decoration: BoxDecoration(color: avatarBg, border: Border.all(color: AppTheme.primary, width: 2))),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(location, style: const TextStyle(fontSize: 10, color: AppTheme.primary)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(padding: const EdgeInsets.all(4), child: const Icon(Icons.check_circle, color: Colors.green, size: 24)),
              Container(padding: const EdgeInsets.all(4), child: const Icon(Icons.cancel, color: AppTheme.accentRed, size: 24)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDisputeItem(String id, String title, String amount, String desc, {bool isHighPriority = false}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppTheme.primary, width: 3),
        boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(4, 4))],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (isHighPriority)
            Positioned(
              top: -36,
              right: -36,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(color: AppTheme.accentRed, border: Border.all(color: AppTheme.primary, width: 2)),
                child: const Text('高優先級', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, color: Colors.white)),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('編號: $id', style: const TextStyle(fontFamily: 'Inter', fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                        const SizedBox(height: 4),
                        Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 18, fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                  Text(amount, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 16),
              Text(desc, style: const TextStyle(fontFamily: 'Inter', fontSize: 14, height: 1.5)),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      color: AppTheme.primary,
                      alignment: Alignment.center,
                      child: const Text('仲裁', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 3)),
                    child: const Icon(Icons.more_vert),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthStat(String label, String value) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.white30, width: 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontFamily: 'Inter', fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white70)),
          Text(value, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }
}
