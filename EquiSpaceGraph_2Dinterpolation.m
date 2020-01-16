% When obtaining data through digitizing graphs, the x-axis is often not
% equispaced. In order to get a worksheet with readable/useable data, we
% need to interpolate the data to certain x-axis values. This function does that.
% --------------------------------------------------------------------------------------------
%% INPUTS
% x = array input of x axis values - requires more than 1 value to work
% y = array input of y axis values - same length as x-axis
% x_interp_min = minimum x-axis value for the new interpolated/extrapolated graph
% x_interp_max = maximum x-axis value for the new interpolated/extrapolated graph
% number of points (optional) = number of x-axis points required (interval between the points)
% --------------------------------------------------------------------------------------------
%% Outputs
% x_interp = interpolated/extrapolated x-axis values
% y_interp = interpolated/extrapolated y-axis values
% --------------------------------------------------------------------------------------------

function [x_interp, y_interp] = EquiSpaceGraph_2Dinterpolation(x, y, x_interp_min, x_interp_max, number_of_points)
%% Errors
if length(x)==1 || length(y)==1
    error('Need more data points for x-axis and/or y-axis')
end
if nargin < 4
    error('Not enough input arguments for the function');
end

%% If number of interpolation points is not provided, then it self calculates
if nargin == 4
    number_of_points = abs(x_interp_max-x_interp_min); %in case of negative numbers
    n=0;
    while (floor(number_of_points*10^n)~=number_of_points*10^n)
    n=n+1;
    end
    number_of_points = (number_of_points)*10^n+1;
end

%% Interpolation section
[x] = unique(x); % Sort x and remove repeats

x_interp = linspace(x_interp_min,x_interp_max,number_of_points)'; % Equispacing the x-axis
y_interp = interp1(x,y,x_interp,'linear','extrap'); % Interpolation/extrapolation

%% Plot the result
figure(1)
plot(x,y,'-*b') % Plot in blue straight solid line
hold on
plot(x_interp,y_interp,'--pr') % Plot in red dashed lines
hold off
grid
x_axis_min = x_interp_min;
x_axis_max = x_interp_max;
y_axis_min = min(y_interp)-abs(min(y)/10); % 1/10th less than the least y value
y_axis_max = max(y_interp)+abs(max(y)/10); % 1/10th higher than the highest y value
axis([x_axis_min x_axis_max y_axis_min y_axis_max])
legend('Original','Interpolated')

end
