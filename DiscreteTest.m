function DiscreteTest(distribution_type)
%distribution_type = 'pascal'; OK
%distribution_type = 'hipergeometric'; OK
%distribution_type = 'binomial'; shit
%distribution_type = 'geometric'; OK
%distribution_type = 'poisson'; OK
%distribution_type = 'uniform'; OK
%distribution_type = 'bernoulli' OK
%distribution_type = 'Plusz'; OK?
    switch (distribution_type)

      case 'uniform'
      x = (0:9);
      parameters=(5);
      f = DiscretePDF(x,distribution_type,parameters);
      subplot(1,2,1);
      plot(x,f,'k.');
      hold on;

      F = DiscreteCDF(x,distribution_type,parameters);
      stairs(x,F,'r');
      subplot(1,2,2);

      f=unidpdf(x,5);
      plot(x,f,'k.');
      hold on

      F=unidcdf(x,5);
      stairs(x,F,'r');


    case 'bernoulli'      
      x = (0:9);
      parameters=(1/3);
      f = DiscretePDF(x,distribution_type,parameters);
      subplot(1,2,1);
      plot(x ,f,'k.');
      hold on;

      F = DiscreteCDF(x,distribution_type,parameters);
      stairs(x,F,'r');
      subplot(1,2,2);

      f = binopdf(x,1,1/3);
      plot(x, f,'k.');
      hold on

      F = binocdf(x,1,1/3);
      stairs(x,F,'r');

    case 'geometric'
      x = (1:9);
      parameters=(3/4);
      f = DiscretePDF(x,distribution_type,parameters);
      subplot(1,2,1);
      plot(x,f,'k.');
      hold on;

      F = DiscreteCDF(x,distribution_type,parameters);
      stairs(x,F,'r');
      subplot(1,2,2);

      f=geopdf(x - 1,3/4);
      plot(x,f,'k.');
      hold on

      F=geocdf(x - 1,3/4);
      stairs(x,F,'r');
      %tpdf-nel n-t meg kell adni

    case 'binomial'
      x = (0:9);
      parameters=[6, 2/5];
      f = DiscretePDF(x,distribution_type,parameters);
      subplot(1,2,1);
      plot(x,f,'k.');
      hold on;

      F = DiscreteCDF(x,distribution_type,parameters);
      stairs(x,F,'r');
      subplot(1,2,2);
      hold on;

      f=binopdf(x,6,2/5);
      plot(x,f,'k.');
      hold on

      F=binocdf(x,6,2/5);
      stairs(x,F,'r');

    case 'hipergeometric'
      x = (0:9);
      parameters=[5, 2, 3];
      f = DiscretePDF(x,distribution_type,parameters)
      subplot(1,2,1);
      plot(x,f,'k.');
      hold on;

      F = DiscreteCDF(x,distribution_type,parameters);
      stairs(x,F,'r');
      subplot(1,2,2);

      f= hygepdf(x,5,2,3)
      plot(x,f,'k.');
      hold on

      F = hygecdf(x,5,2,3);
      stairs(x,F,'r');

       case 'pascal'
        x = (1:9);
        parameters=[3, 1/3];
        f = DiscretePDF(x,distribution_type,parameters);
        subplot(1,2,1);
        plot(x,f,'k.');
        hold on;

        F = DiscreteCDF(x,distribution_type,parameters);
        stairs(x,F,'r');
        subplot(1,2,2);

        n= length(x);
        f=nbinpdf(x,parameters(1),parameters(2));
        plot(x,f,'k.');
        hold on

        F=nbincdf(x,parameters(1),parameters(2));
        stairs(x,F,'r');

      case 'poisson'
        x = (0:9);
        parameters= 5;
        f = DiscretePDF(x,distribution_type,parameters);
        subplot(1,2,1);
        plot(x,f,'k.');
        hold on;

        F = DiscreteCDF(x,distribution_type,parameters);
        stairs(x,F,'r');
        subplot(1,2,2);

        f=poisspdf(x,parameters(1));
        plot(x,f,'k.');
        hold on

        F=poisscdf(x,parameters(1));
        stairs(x,F,'r');

      case 'Plusz'
 
        x = (1:11);
        parameters=[];
        f = DiscretePDF(x,distribution_type,parameters);
        subplot(1,2,1);
        plot(x,f,'k.');
        hold on;

        F = DiscreteCDF(x,distribution_type,parameters);
        stairs(x,F,'r');
        subplot(1,2,2);
        disp("X < 5");
        er = f(1) + f(2) + f(3) + f(4)

        disp("X >= 6");
        er = f(6) + f(7)

        disp("1 < X <= 4");
        er = f(2) + f(3) + f(4)

    end
end
