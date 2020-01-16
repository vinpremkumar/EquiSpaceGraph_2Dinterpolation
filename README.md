# EquiSpaceGraph_2Dinterpolation
When digitizing graphs or experimenting devices under different conditions, the x-axis would be often either not equispaced, or does not match up between the different data. In order to get a worksheet with readable/useable data, we need to interpolate/extrapolate the data to certain x-axis values. This function does that.

# Function format:
[x_interp, y_interp] = EquiSpaceGraph_2Dinterpolation(x, y, x_interp_min, x_interp_max, number_of_points)

# Inputs:
x = array input of x axis values - requires more than 1 value to work
y = array input of y axis values - same length as x-axis
x_interp_min = minimum x-axis value for the new interpolated/extrapolated graph
x_interp_max = maximum x-axis value for the new interpolated/extrapolated graph
number of points (optional) = number of x-axis points required (interval between the points)

# Outputs:
x_interp = interpolated/extrapolated x-axis values
y_interp = interpolated/extrapolated y-axis values
