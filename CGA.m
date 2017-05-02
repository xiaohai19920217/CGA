

 global n  T M M_original;  %  基本参数 
 global CGA_Cmax_record CGA_Time_record  best_generation best_individual;
 global Best_Fitness fitness 
 %----------初始化阶段------------------------
 K=0;
 %n=10;
 T =j10c10c1;
 T_Size = size(T);
 M_original  = cell(1,T_Size(2)-1);
for j = 1:length(M_original)
    M_original{j}=zeros(1,3);
end
%M_original = {zeros(1,3),zeros(1,3),zeros(1,2),zeros(1,3),zeros(1,2)};
 M = M_original ; 
 n = T_Size(1);    %染色体大小 
 CGA_Time_record = [];
 CGA_Cmax_record=[];
 Best_Fitness = inf ;
 U_Plan = zeros(1,n);
 I ={zeros(1,n);zeros(1,n)} ;
% M=zeros(1,n);
 P=ones(n)/n ;  %初始概率模型
 %-------循环过程并生成新个体----------
 while K<500
     if K==10
        K=10; 
     end
     for ge_number=1:2;
         I{ge_number}=New_One(P);
         %best_individual=I{i};
         %K= best_individual(2);
     end
%-----------------选择最优个体----------------------------%    
          fitness1=ProcessTime_FIFO (I{1});
          fitness2=ProcessTime_FIFO (I{2});
          fitness=min(fitness1,fitness2);
          if fitness== fitness1
              best_individual1=I{1};
          else
              best_individual1=I{2};
          end
          if fitness<Best_Fitness
             best_generation=K;
             Best_Fitness=fitness;
             best_individual=best_individual1;
             disp([ '最优代数: ',num2str(best_generation)])
             disp([ '最优适应度: ',num2str(Best_Fitness)])
          end
    
     
     P=Update_P(P);
     stop_n=Check_P(P);
     if  stop_n==1
         break
     end
     K=K+1;
     
 end

 %disp([ '最优代数: ',num2str(best_generation)])
 %disp([ '最优适应度: ',num2str(Best_Fitness)])
     