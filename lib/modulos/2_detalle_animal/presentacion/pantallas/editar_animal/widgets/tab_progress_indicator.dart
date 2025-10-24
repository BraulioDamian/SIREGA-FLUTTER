import 'package:flutter/material.dart';

class TabProgressIndicator extends StatelessWidget {
  final int currentTab;
  final int totalTabs;
  final List<String> tabNames;
  final List<IconData> tabIcons;

  const TabProgressIndicator({
    super.key,
    required this.currentTab,
    required this.totalTabs,
    required this.tabNames,
    required this.tabIcons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(totalTabs, (index) {
          final isActive = index == currentTab;
          final isCompleted = index < currentTab;
          
          return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? Theme.of(context).primaryColor
                                  : isCompleted
                                      ? Colors.green
                                      : Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isCompleted ? Icons.check : tabIcons[index],
                              color: isActive || isCompleted ? Colors.white : Colors.grey.shade600,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        tabNames[index],
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                          color: isActive
                              ? Theme.of(context).primaryColor
                              : isCompleted
                                  ? Colors.green
                                  : Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (index < totalTabs - 1)
                  Container(
                    width: 20,
                    height: 2,
                    color: isCompleted ? Colors.green : Colors.grey.shade300,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
