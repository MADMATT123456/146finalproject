%earth parking orbit
orbit.ep.a=6878;         % Earth radius 6378 km + 500 km altitude (km)
orbit.ep.e=0;            % Circular orbit assumption
orbit.ep.inc=1.71042;         % Inclination (rad)
orbit.ep.raan=0;         % orbital simulation to determine(rad)
orbit.ep.aop=NaN;        % Argument of Periapsis (undefined for e=0) 
orbit.ep.frame='ECI';    % Earth-Centered Inertial frame
orbit.ep.u=0.39860e6;     %km3/s2
orbit.ep.T=findT(orbit.ep);    %days
orbit.ep.p=orbit.ep.a*(1-orbit.ep.e^2);
orbit.ep.h=sqrt(orbit.ep.p*orbit.ep.u);
orbit.ep.plane=htrans(orbit.ep);

%earth orbit
orbit.ste.a=1.49598e8;      %(km)
orbit.ste.e=0.01671022;
orbit.ste.inc=8.726646259971647e-07;       %inclination(rad)
orbit.ste.raan=-0.19653524;    %(rad)
orbit.ste.aop=1.79676742;        %argument of periapsis(rad)
orbit.ste.frame='Heliocentric';
orbit.ste.peritime=2460860.037500;
orbit.ste.u=132712e6;     %km3/s2
orbit.ste.T=findT(orbit.ste)/3600/24;    %days
orbit.ste.p=orbit.ste.a*(1-orbit.ste.e^2);
orbit.ste.h=sqrt(orbit.ste.p*orbit.ste.u);
orbit.ste.plane=htrans(orbit.ste);

%mars orbit
orbit.stm.a=2.279368e8;  %(km)
orbit.stm.e=0.09341233;
orbit.stm.inc=0.03229923767;        %inclination(rad)
orbit.stm.raan=0.86530876;     %(rad)
orbit.stm.aop=5.0003683;      %argument of periapsis(rad)
orbit.stm.frame='Heliocentric';
orbit.stm.u=132712e6;     %km3/s2
orbit.stm.T=findT(orbit.stm)/3600/24;    %days
orbit.stm.peritime=2454252.805556;
orbit.stm.p=orbit.stm.a*(1-orbit.stm.e^2);
orbit.stm.h=sqrt(orbit.stm.p*orbit.stm.u);
orbit.stm.plane=htrans(orbit.stm);

%planet.earth
planet.earth.mass=5.9722e24;   %Kg
planet.earth.u=3.986004418e5;           %gravitational parameter?(km^3/s^2)
planet.earth.radius=6371.000;     %Volumetric mean radius(km)
planet.earth.rav=7.27e-5;     %self-rotational angular velocity(rad/s)
planet.earth.rinc=0.4092797;        %rotation inclination(rad)

%planet.mars
planet.mars.mass=0.64169e24;    %Kg
planet.mars.u=4.282837e4;      %(km^3/s^2)
planet.mars.radius=3389.5;    %Volumetric mean radius(km)
planet.mars.rav=7.08e-5;     %self-rotational angular velocity(rad/s)
planet.mars.rinc=0.439648;        %rotation inclination(rad)

%planet.sun
planet.sun.mass=1988400e24;
planet.sun.u=132712e6;

%starship
starship.mass = 100000;                 % Dry mass (kg)
starship.fuel.mass = 2300000;           % Fuel mass (kg)
starship.fuel.isp = 390;                % ISP in vacuum (s)
starship.fuel.thrust = 2.75e6;          % Total thrust (N)
starship.pos = [6878, 0, 0];            % Assuming 500 km altitude circular orbit (km)
starship.vel = NaN;                     % To be determined
starship.acc = NaN;                     % To be determined

save('finaldata.mat',"planet","orbit","starship")

%%
%find plane vector
function planevector=htrans(orbit)
i=orbit.inc;
R=orbit.raan;
planevector=[sind(i)*cosd(R);sind(i)*sind(R);cosd(i)];
end

%%
% find period
function T=findT(orbit)
u=orbit.u;
a=orbit.a;
T=(2*pi/sqrt(u))*a^(3/2);
end