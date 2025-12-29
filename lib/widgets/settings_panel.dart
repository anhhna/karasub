import 'package:flutter/material.dart';

class SettingsPanel extends StatelessWidget {
  const SettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      color: const Color(0xFF252526),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildActorSection(),
            _buildTabs(),
            _buildExpandableSection(
              'Screen',
              true,
              [
                _buildPropertyRow('Preset', 'HDTV 1080'),
                _buildPropertyRow('Pixel Aspect Ratio', 'Square Pixel'),
                _buildPropertyRow('Width', '1920', isEditable: true),
                _buildPropertyRow('Height', '1080', isEditable: true),
              ],
            ),
            _buildExpandableSection('Viewport', true, []),
            _buildExpandableSection(
              'Layout',
              true,
              [
                _buildPropertyRow('Mode', 'One Row'),
                _buildPropertyRow('Align', 'Center'),
                _buildPropertyRow('Position', 'X:0.0  Y:94.0'),
                _buildPropertyRow('Scale', '100.0%'),
                _buildCheckboxRow('Vertical'),
                _buildCheckboxRow('Right-to-left Reading Order'),
                _buildPropertyRow('Path Curvature', '0.0', isEditable: true),
              ],
            ),
            _buildExpandableSection(
              'Time',
              true,
              [
                _buildPropertyRow('Step In', '2000(ms)', isEditable: true),
                _buildPropertyRow('Step Out', '2000(ms)', isEditable: true),
                _buildPropertyRow('Offset', '0(ms)', isEditable: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActorSection() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Actor',
            style: TextStyle(fontSize: 11, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF3C3C3C),
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButton<String>(
              value: 'Default',
              isExpanded: true,
              dropdownColor: const Color(0xFF3C3C3C),
              underline: Container(),
              items: ['Default'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(fontSize: 12)),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _buildTab('Basic', true),
          _buildTab('Subtitle', false),
          _buildTab('Effects', false),
          _buildTab('Decoration', false),
        ],
      ),
    );
  }

  Widget _buildTab(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF0078D4) : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          color: isSelected ? Colors.white : Colors.white54,
        ),
      ),
    );
  }

  Widget _buildExpandableSection(String title, bool isExpanded, List<Widget> children) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Icon(
                  isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
                  size: 20,
                  color: Colors.white70,
                ),
                const SizedBox(width: 4),
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) ...children,
      ],
    );
  }

  Widget _buildPropertyRow(String label, String value, {bool isEditable = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Colors.white70),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isEditable ? const Color(0xFF3C3C3C) : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 11,
                color: isEditable ? const Color(0xFF4FC3F7) : Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxRow(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (_) {},
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
