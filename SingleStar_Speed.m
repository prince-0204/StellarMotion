% loading data of all 7 stars
load starData
nObs = size(spectra,1);         % getting size of the vector having data of first star
lambdaStart = 630.02;           % Starting Wavelength for analysis
lambdaDelta = 0.14;           

lambdaEnd = lambdaStart + (nObs-1)*lambdaDelta;     % Ending Wavelength for analysis
lambda = (lambdaStart:lambdaDelta:lambdaEnd);

s = spectra(:,2);                % Extract the data of intensities for second star in spectra to a vector named s

% Plot the Intensity as a function of wavelength
plot(lambda,s,".-")
xlabel("Wavelength")
ylabel("Intensity")

[sHa,idx] = min(s);             % storing minimum intensity and index of minimum intensity in the vetor
lambdaHa = lambda(idx);         % getting the HYDROGEN ALPHA LINE wavelength for the star

% marking the minimum intensity point on the plot
hold on;
plot(lambdaHa,sHa,"rs",MarkerSize=8);
hold off;

% calculating the deviation of the characteristics spectrum from hydrogen
% Hydrogen absorbs light at 656.28 nm
z = lambdaHa/656.28 - 1;

% Calculating the speed of light by multiplying the deviation with speed of
% light
speed = z*299792.458;

% Determining the direction of star
if z < 0 
    disp("The star is having a blue shift and is moving towards the earth.")
else
    disp("The star is having a red shift and is moving away from the earth.")
end

% Printing the speed of the star
fprintf("The speed of the star is %f km/s",speed);

