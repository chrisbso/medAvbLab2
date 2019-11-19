h = figure;
axis tight auto % this ensures that getframe() returns a consistent size
filename = 'testAnimated.gif';
for n = 1:40
      imshow(double(image(:,:,n))/max(max(double(image(:,:,n)))),'InitialMagnification','fit');
      title(['TE = ' num2str(n*spTE) ' ms']);% Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if n == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
end