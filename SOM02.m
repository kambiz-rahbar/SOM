% Solve a Clustering Problem with a Self-Organizing Map
% Script generated by Neural Clustering app
% Created 23-Nov-2019 08:48:28
%
% This script assumes these variables are defined:
%
%   X - input data.

x = X;

% Create a Self-Organizing Map
dimension1 = 10;
dimension2 = 1;
coverSteps = 100; %number of training steps for initial covering of the input space (default = 100)
initNeighbor = 3; %initial neighborhood size (default = 3)
topologyFcn = 'hextop'; % 'gridtop', 'randtop', 'tritop' (default = 'hextop')
distanceFcn = 'linkdist'; % 'boxdist', 'dist', 'linkdist', 'mandist' (default = 'linkdist')
net = selforgmap([dimension1 dimension2], coverSteps, initNeighbor, topologyFcn, distanceFcn);

% Choose Plot Functions
% For a list of all plot functions type: help nnplot
net.plotFcns = {'plotsomtop', 'plotsomnc', 'plotsomnd', 'plotsomplanes', 'plotsomhits', 'plotsompos'};

% Train the Network
net.trainParam.showWindow = 1;
net.trainParam.showCommandLine = 1;
net.trainParam.show = 10;
net.trainParam.epochs = 1000;
[net,tr] = train(net,x);

% Test the Network
y = net(x);

% View the Network
view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotsomtop(net)
%figure, plotsomnc(net)
%figure, plotsomnd(net)
%figure, plotsomplanes(net)
figure, plotsomhits(net,x)
figure, plotsompos(net,x)

%% cluster data
data_cluster = vec2ind(net(X));
cluster_center = cell2mat(net.IW);
max_class_number = max(data_cluster);
class_color = prism(max_class_number);
figure;
hold on;
grid minor;
title('SOM Clustering')
for k=1:max(data_cluster)
    plot(X(1,data_cluster==k),X(2,data_cluster==k),'o','color',class_color(k,:));
end
plot(cluster_center(:,1),cluster_center(:,2),'Ok','linewidth',5,'markersize',10);

%% feature extraction
disp(X(:,2)');
disp(net(X(:,2))');
data_cluster = vec2ind(net(X(:,2)));
disp(data_cluster);

