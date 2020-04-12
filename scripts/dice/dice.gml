/// @description dice(side, [number])
/// @function dice
/// @param side { integer }
/// @param [number] { integer }
var number = 1 < argument_count ? argument[1] : 1
return irandom_range(number, number * argument[0])
