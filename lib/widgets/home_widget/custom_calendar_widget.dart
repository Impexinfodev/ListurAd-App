import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime _displayedMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _displayedMonth = DateTime(_selectedDate.year, _selectedDate.month);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          const SizedBox(height: 12),
          _buildDaysOfWeek(),
          const SizedBox(height: 6),
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final monthNames = List.generate(12, (i) => DateFormat.MMMM().format(DateTime(0, i + 1)));

    final years = List.generate(
      widget.lastDate.year - widget.firstDate.year + 1,
      (index) => widget.firstDate.year + index,
    );

    return Row(
      children: [
        // Today button
        TextButton(
          onPressed: () {
            setState(() {
              _selectedDate = DateTime.now();
              _displayedMonth = DateTime(_selectedDate.year, _selectedDate.month);
              widget.onDateSelected(_selectedDate);
            });
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
          child: Text(
            'Today',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.clr2388FF,
              fontFamily: AppFonts.medium,
              fontSize: 16.sp,
            ),
          ),
        ),
        Spacer(),
        DropdownButtonHideUnderline(
          child: DropdownButton2<int>(
            isExpanded: true,
            value: _displayedMonth.month,
            hint: const Text('Month'),
            items: List.generate(
              12,
              (index) => DropdownMenuItem(
                value: index + 1,
                child: Text(
                  monthNames[index],
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.clr6D758F,
                    fontFamily: AppFonts.regular,
                  ),
                ),
              ),
            ),
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _displayedMonth = DateTime(_displayedMonth.year, value);
              });
            },
            buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              height: 30.h,
              width: 90.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11.r),
                border: Border.all(color: AppColors.clrF1F3F7, width: 1.6.w),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.clr2388FF.withOpacity(0.10),
                    blurRadius: 6,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(height: 40),
            dropdownStyleData: DropdownStyleData(
              width: 90.w,
              maxHeight: 200.h,
              padding: EdgeInsets.symmetric(vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11.r),
                border: Border.all(color: AppColors.clrF1F3F7, width: 1.6.w),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.clr2388FF.withOpacity(0.10),
                    blurRadius: 6,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              elevation: 4,
              offset: const Offset(0, -2),
            ),
            iconStyleData: IconStyleData(
              iconSize: 16,
              iconEnabledColor: Colors.black,
              iconDisabledColor: Colors.grey,
              icon: Icon(Icons.keyboard_arrow_down, size: 16.sp, color: AppColors.clr6D758F),
            ),
          ),
        ),
        const SizedBox(width: 10),
        DropdownButtonHideUnderline(
          child: DropdownButton2<int>(
            isExpanded: true,
            value: _displayedMonth.year,
            hint: const Text('Year'),
            items: years
                .map(
                  (y) => DropdownMenuItem(
                    value: y,
                    child: Text(
                      '$y',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.clr6D758F,
                        fontFamily: AppFonts.regular,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _displayedMonth = DateTime(value, _displayedMonth.month);
              });
            },
            buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              height: 30.h,
              width: 85.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11.r),
                border: Border.all(color: AppColors.clrF1F3F7, width: 1.6.w),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.clr2388FF.withOpacity(0.10),
                    blurRadius: 6,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(height: 40),
            dropdownStyleData: DropdownStyleData(
              width: 85.w,
              maxHeight: 200.h,
              padding: EdgeInsets.symmetric(vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11.r),
                border: Border.all(color: AppColors.clrF1F3F7, width: 1.6.w),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.clr2388FF.withOpacity(0.10),
                    blurRadius: 6,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              elevation: 4,
              offset: const Offset(0, -2),
            ),
            iconStyleData: IconStyleData(
              iconSize: 16,
              iconEnabledColor: Colors.black,
              iconDisabledColor: Colors.grey,
              icon: Icon(Icons.keyboard_arrow_down, size: 16.sp, color: AppColors.clr6D758F),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDaysOfWeek() {
    final days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days
          .map(
            (d) => Expanded(
              child: Center(
                child: Text(
                  d,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.clr9199B5,
                    fontFamily: AppFonts.medium,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final firstDayOfMonth = DateTime(_displayedMonth.year, _displayedMonth.month, 1);
    final weekdayOfFirst = firstDayOfMonth.weekday == 7 ? 0 : firstDayOfMonth.weekday;
    final daysInMonth = DateUtils.getDaysInMonth(_displayedMonth.year, _displayedMonth.month);

    final int leadingEmpty = (weekdayOfFirst + 6) % 7;

    final totalCells = 42;

    return SizedBox(
      height: 230,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: totalCells,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemBuilder: (context, index) {
          final dayNum = index - leadingEmpty + 1;

          if (index < leadingEmpty || dayNum > daysInMonth) {
            return const SizedBox();
          }

          final date = DateTime(_displayedMonth.year, _displayedMonth.month, dayNum);

          final isDisabled = date.isBefore(widget.firstDate) || date.isAfter(widget.lastDate);

          final isToday = _isSameDate(date, DateTime.now());

          final isSelected = _isSameDate(date, _selectedDate);

          return GestureDetector(
            onTap: isDisabled
                ? null
                : () {
                    setState(() {
                      _selectedDate = date;
                      widget.onDateSelected(date);
                    });
                  },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? AppColors.clr2388FF : Colors.transparent,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  '$dayNum',
                  style: TextStyle(
                    color: isDisabled
                        ? AppColors.clrE1E4ED
                        : isSelected
                        ? Colors.white
                        : isToday
                        ? Colors.blue
                        : AppColors.clrE1E4ED,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    fontFamily: AppFonts.semibold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
