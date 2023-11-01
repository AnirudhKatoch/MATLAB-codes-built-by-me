data = readtable('Cylindrical_cell_homogeneous_and_heterogenous_node_left_and_right.xlsx', 'Sheet', 'Sheet1');
plot(data.Var1,data.heterogeneousLeftPoint1,'r','LineWidth', 1.75)
hold on
plot(data.Var1,data.heterogeneousRightPoint2,'b','LineWidth', 1.75)
hold on
plot(data.Var1,data.homogeneousLeftPoint1,'m','LineWidth', 1.75)
hold on
plot(data.Var1,data.homogeneousLeftPoint2,'k','LineWidth', 1.75)
legend("Heterogeneous model node at point 1 ","Heterogeneous model node at point 2" ,"Homogeneous model node at point 1 " , "Homogeneous model node at point 2" ,'Location', 'southeast')
xlabel("Time (s)");
ylabel("Average Temperature [°C]");
grid on 