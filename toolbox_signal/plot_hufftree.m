function plot_hufftree(T,p)

% plot_hufftree - plot a huffman tree 
%
%   plot_hufftree(T);
%
%   Copyright (c) 2008 Gabriel Peyre

hold on;
plot_tree(T{1},[0,0],1);
hold off;
axis tight;
axis off;

%%
function plot_tree(T,x,j)

tw = 15;
lw = 1.5;
ms = 10;

if not(iscell(T))
    de = [-.02 -.2];
    % display a string
    u = text(x(1)+de(1),x(2)+de(2),num2str(T));
    set(u,'FontSize',tw);
else
    % display a split
    h0 = 1/2^j;
    h = 1 * h0;
    u = plot( [x(1) x(1)-h], [x(2) x(2)-1], '.-' );
    set(u,'MarkerSize',ms);
    set(u,'LineWidth',lw);
    u = plot( [x(1) x(1)+h], [x(2) x(2)-1], '.-' );
    set(u,'MarkerSize',ms);
    set(u,'LineWidth',lw);
    plot_tree(T{1},[x(1)-h x(2)-1],j+1);
    plot_tree(T{2},[x(1)+h x(2)-1],j+1);
end