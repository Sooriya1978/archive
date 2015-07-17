#Static values
timestep = 0.5
sec_year = 365*24*60*60
ocean_thickness = 400
albedo = 0.3

#Stefan–Boltzmann
sb = 5.67E-8 

#One calorie in Joule
cal = 4.184

#The definition of 1 calorie, is the heat necessary to up temperature of 
# 1 cm^3 of water in 1° Celsius, because the water density 1 g/cm^3.   
#What is the heat necessary to up the temperature in 1° Celsius of 1m^3 water?
#That is: converting g/cm^3/K to J/m^3/K
cubic = 10E+6
heat = cal*cubic

#Heat capacity in J/(K m^2)
heat_capacity = heat*ocean_thickness

#Solar Constant Watts/m^2
L = 1350

#Number of iterations
iterations = 2000

#Inicial values
time0 = 0
T0 = 600
heat0 = heat_capacity*T0
in0 = (L/4)*(1-albedo)
loss0 = 0
if(T0 != 0 ) {
  loss0 = sb*(T0^4)
} 

net0 = (in0 - loss0)*timestep*sec_year      

output = data.frame(time0,heat0,T0,in0,loss0,net0)
colnames(output) = c('time',
                     'heat_content',
                     'temperature',
                     'solar_in',
                     'heat_loss',
                     'net_heat_flux')

for (i in seq(2,iterations)) 
{
  #Time
  output[i,1] = output[i-1,1] + timestep
  #Heat Content
  output[i,2] = output[i-1,2] + output[i-1,6]
  #Temperature
  output[i,3] = output[i,2] / heat_capacity
  #solar in
  output[i,4] = (L/4)*(1-albedo)
  #heat loss
  output[i,5] = sb*(output[i,3]^4)
  #net heat flux
  output[i,6] = (output[i,4] - output[i,5])*timestep*sec_year                
}

plot(output$time,
     output$temperature)




