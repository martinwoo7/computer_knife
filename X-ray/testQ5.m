% Generate ellipsoid points
[x, y, z] = rand_ellipsoid(20, [1 2 3]);

% Translate center to [1 1 1]
points = [x+1, y+1, z+1];

angles = 15:15:360;
k = {};
% Get 24 silhouettes
for i = 1:length(angles)
	disp(i);
	k{i} = tumorProject(angles(i), points);
end
[q,w,r] = ellipsoid(1,1,1,1,2,3);

% They all return the same thing aside from the first two. Those don't even
% work properly.

% This one also doesn't really work :(
% figure;
% title('1 image not really');
% hold on;
% surf(q,w,e);
% [a, v1] = tumorRecon(360, k{24});
% hold off;

% This one doesn't work :(
% angs = [];
% tumors = [];
% for i = 12:12:24
% 	angs = horzcat (angs, angles(i));
% 	tumors = vertcat (tumors, k{i});
% end
% figure;
% title('2 images');
% hold on;
% surf(q,w,r);
% [b, v2] = tumorRecon(angs, tumors);
% hold off;

% angs = [];
% tumors = [];
% for i = 6:6:24
% 	angs = horzcat (angs, angles(i));
% 	tumors = vertcat (tumors, k{i});
% end
% figure;
% title('4 images');
% hold on;
% surf(q,w,r);
% [c, v3] = tumorRecon(angs, tumors);
% hold off;

% angs = [];
% tumors = [];
% for i = 4:4:24
% 	angs = horzcat (angs, angles(i));
% 	tumors = vertcat (tumors, k{i});
% end
% figure;
% title('6 images');
% hold on;
% surf(q,w,r);
% [d, v4] = tumorRecon(angs, tumors);
% hold off;

% angs = [];
% tumors = [];
% for i = 2:2:24
% 	angs = horzcat (angs, angles(i));
% 	tumors = vertcat (tumors, k{i});
% end
% figure;
% title('12 images');
% hold on;
% surf(q,w,e);
% [e, v5] = tumorRecon(angs, tumors);
% hold off;

angs = [];
tumors = [];
for i = 1:24
	angs = horzcat (angs, angles(i));
	tumors = vertcat (tumors, k{i});
end
figure;
title('24 images');
hold on;
surf(q,w,r);
[d, v4] = tumorRecon(angs, tumors);
hold off;