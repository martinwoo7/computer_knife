% Function to compute the linear function using equation y = mx + b.
%
% Inputs: Point1 (P1) [x,y]
%         Point2 (P2) [x,y]
%
% Output: y value (y) [y]

function [y] = Compute_Linear_Function(P1, P2, x)
    
    % m = rise/run
    rise = P2(2) - P1(2);
    run = P2(1) - P1(1);
    
    % Catch statements
    
    % If 2 points are the same
    if (P1 == P2)
         % If x value is the same as points return y, else y cannot be
         % found
        if (x == P1(1))
            y = P1(2);
            return;
        else 
            disp(sprintf('Point 1 and Point 2 are same point, y value at %f cannot be determined',x));
            y = NaN;
            return;
        end
        % If two points x value is the same, create verticle line, cannot
        % find y
    else if (P1(1) == P2(1))
             disp('Point 1 and Point 2 create verticle line, y value cannot be determined');
             y = NaN;
             return;
             % If two points y values are the same, create a horizontal
             % line, y will always be the y component of either point.
        else if (P1(2) == P2(2))
                y = P1(2);
                return;
            end
        end
    end
    
    % m = slope
    m = rise./run;
    
    % b is the y - intercept.
    % find where the line intercepts the y axis
    Point1 = [P1(1), P1(2), 0];
    Point2 = [P2(1), P2(2), 0];
    b = Q2A1(Point1, Point2, [0,0,0], [0,1,0]);
    
    % take the y value of found y intecept
    b = b(2);
    mx = m.*x;
    
    % y = mx + b
    y = mx + b;
end