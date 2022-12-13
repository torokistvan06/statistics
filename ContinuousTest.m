function ContinuousTest(distribution_type)

%distribution_type='beta'; OK
%distribution_type='egyenletes'; OK
%distribution_type='student'; OK
%distribution_type='exponencialis'; shit
%distribution_type='normal'; OK
%distributin_type='gamma' OK
%distribution_type = 'pearson' OK
%distribution_type = 'Plusz' OK

    switch (distribution_type)
    case 'gamma'
        x = (1/100:0.1:35);
        parameters = [6, -2];
        f = ContinuousPDF(x,distribution_type,parameters);
        subplot(1,2,1);
        plot(x,f,'k');
        hold on;

        F = ContinuousCDF(x,distribution_type,parameters);
        plot(x,F,'r');
        subplot(1,2,2);
        f = gampdf(x,1/2,3);
        plot(x,f,'k');
        hold on
        F = gamcdf(x,1/2,3);
        plot(x,F,'r')
    case 'normal'
      x = (-5:0.01:5);
      parameters=[1,2];
      f = ContinuousPDF(x,distribution_type,parameters);
      subplot(1,2,1);
      plot(x,f,'k');
      hold on;

      F = ContinuousCDF(x,distribution_type,parameters);
      plot(x,F,'r');
      subplot(1,2,2);

      n= length(x);
      f=normpdf(x,parameters(1),parameters(2));
      plot(x,f,'k');
      hold on

      F=normcdf(x,parameters(1),parameters(2));
      plot(x,F,'r');
      %tpdf-nel n-t meg kell adni

    case 'egyenletes'
      x = (-5:0.01:5);
      parameters=[-3, 2];
      f = ContinuousPDF(x,distribution_type,parameters);
      subplot(1,2,1);
      plot(x,f,'k');
      hold on;

      F = ContinuousCDF(x,distribution_type,parameters);
      plot(x,F,'r');
      subplot(1,2,2);

      f=unifpdf(x,parameters(1),parameters(2));
      plot(x,f,'k');
      hold on

      F=unifcdf(x,parameters(1),parameters(2));
      plot(x,F,'r')

    case 'beta'
      x = (-5:0.01:5);
      parameters=[3,2];
      f = ContinuousPDF(x,distribution_type,parameters);
      subplot(1,2,1);
      plot(x,f,'k');
      hold on;

      F = ContinuousCDF(x,distribution_type,parameters);
      plot(x,F,'r');
      subplot(1,2,2);

      f=betapdf(x,parameters(1),parameters(2));
      plot(x,f,'k');
      hold on

      F=betacdf(x,parameters(1),parameters(2));
      plot(x,F,'r');

      case 'student'
        x = (-5:0.01:5);
      parameters = 5;
      f = ContinuousPDF(x,distribution_type,parameters);
      subplot(1,2,1);
      plot(x,f,'k');
      hold on;

      F = ContinuousCDF(x,distribution_type,parameters);
      plot(x,F,'r');
      subplot(1,2,2);

      n= length(x);
      f=tpdf(x,5);
      plot(x,f,'k');
      hold on

      F=tcdf(x,5);
      plot(x,F,'r');
      
      case 'pearson'
        x = (0:0.1:50);
        parameters=[5,10];
        f = ContinuousPDF(x,distribution_type,parameters);
        subplot(1,2,1);
        stairs(x,f,'k');
        hold on;

        F = ContinuousCDF(x,distribution_type,parameters);
        stairs(x,F,'r');
        subplot(1,2,2);
        
        f=gampdf(x,5/2,2*10^2);
        stairs(x,f,'k');
        hold on

        F=gamcdf(x,5/2,2*10^2);
        stairs(x,F,'r');
      case 'exponencialis'
        x = (-5:0.01:5);
        parameters = 3;
        f = ContinuousPDF(x,distribution_type,parameters);
        subplot(1,2,1);
        stairs(x,f,'k');
        hold on;

        F = ContinuousCDF(x,distribution_type,parameters);
        stairs(x,F,'r');
        subplot(1,2,2);

        f=exppdf(x,1/3);
        stairs(x,f,'k');
        hold on

        F=expcdf(x,1/3);
        stairs(x,F,'r');

      case 'Plusz'
        x=(-3:0.1:3);
        parameters=[];
        f = ContinuousPDF(x,distribution_type,parameters);
        subplot(1,2,1);
        plot(x,f,'k');
        hold on;

        F = ContinuousCDF(x,distribution_type,parameters);
        plot(x,F,'r');
        subplot(1,2,2);
        
        disp('X >= -2')
        disp(1 - (ContinuousCDF(-2,distribution_type, 1/34)));
        
        disp('-1/2 < X < 2');
        disp((ContinuousCDF(2,distribution_type, 1/34) - ContinuousCDF(-1/2, distribution_type, 1/34)));
        
    end
end
