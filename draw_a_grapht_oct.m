x1 = 1:4;
y1 = [12.4,15.9,14.3,42.7];
err1 = [1.9,2.5,3.6,2.7];
en1={'build','torq','lux','gen'};
x2 = 7:10;
y2 = [28.6,32.4,25.8,30.1];
err2 = [9.9,11.7,10.8,10.5];
en2={'dc','ac','hz','suply'};
x3 = 13:16;
y3 = [43.2,47.6,45.3,30];
err3 = [4.2,5.5,4.7,1.4];
en3={'lock','head','sim','spec'};
names={'Tes1','Tes2','Tes3','Tes4'}
x=[x1,x2,x3];
y=[y1,y2,y3];
function []= drawgrapht(x,y,err,c1,names,tag,c2,errn,days)
    hb=bar(x, y);
    % Set bar properties

    set(hb, 'FaceColor', c1);
    hold on;
    legend(hb, days);
    hold on;
    % Plot the error bars and capture the handle
    h = errorbar(x, y, err);


    hold on;
    % Set the 'LineStyle' property of the returned graphic handle to 'none'
    set(h, "linestyle", "none",'color', c2,'HandleVisibility', 'off');
    hold on;
    % Optional: add a marker to the data points for better visibility
    %set(h, "marker", "o",'color',c2);
    for i = 1:length(y)
      % Position text at (x, y/2) for center-vertical placement
      text(x(i), 2, names{i}, ...
           'HorizontalAlignment', 'center', ...
           'Color', tag, ...
           'FontSize', 12);
     endfor
     hold on;

     for i = 1:length(x)
    % Position text slightly above the upper error limit (y + err)
         text(x(i), y(i)+3 , errn{i}, ...
           'HorizontalAlignment', 'center', ...
           'Color', c1, ...
           'FontSize', 10,'FontWeight','bold');
     endfor




endfunction

grid on;
hold on;
drawgrapht(x1,y1,err1,[255/255, 153/255, 51/255],names,'black',[0,0,0],en1,{"130 Days", "160 Days","190 Days"});
hold on;
drawgrapht(x2,y2,err2,[102/255, 178/255, 255/255],names,'black',[0,0,0],en2,{"130 Days", "160 Days","190 Days"});
hold on;
drawgrapht(x3,y3,err3,[204/255, 153/255, 255/255],names,'black',[0,0,0],en3,{"130 Days", "160 Days","190 Days"});
hold on;
xlabel('Test', 'FontWeight', 'bold','FontSize', 30);
ylabel('Area(cm^2)', 'FontWeight', 'bold','FontSize', 30);
title('Variation of Test sample with number of days', 'FontWeight', 'bold','FontSize', 30);
legend("130 Days", "160 Days","190 Days", "orientation", "vertical", "numcolumns", 1,'FontSize', 15);
