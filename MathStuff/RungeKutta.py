## Page 281 Question 13 a

## gallons = (0.02 \* 1000 \* 5)/50

gpm = (0.02 * 1000 * 5)/50

## gallons per minute = 2.0
## Current water in tank is 1000 gallons. 1010 gallons - 1000 gallons = 10 gallons. 
## Solving for when the tank will have an additional 10 gallons.

requiredGallons = 10

print("The tank will hold 1010 gallons of salt water after " + \
      str(requiredGallons / gpm) + " minutes.")

def TaylorFour(xi,h,t):
    yp = 0.1 - (3.0 * xi)/(1000.0 + 2.0 * t)
    ypp = ((6.0 * xi) / (1000.0 + (2 * t))**2.0)
    yppp = ((-24.0 * xi) / (1000.0 + (2 * t))**3.0)
    ypppp = ((144.0 * xi) / (1000.0 + (2 * t))**4.0)
    
    result = xi + h*(yp + (h/2.0)*ypp + ((h**2.0)/6.0)*yppp + ((h**3.0)/24.0)*ypppp)
    
    return result

TaylorFour(50,0.5,5)

## 49.97577931111255

## Page 292 Question 27

def RungeKuttaOF(a, b, n, alpha):
    h = (b - a)/n
    t = a
    w = alpha
    for i in range(1, n + 1): 
        k1 = h * f(t,w) 
        k2 = h * f((t + h/2.0), (w + k1/2.0)) 
        k3 = h * f((t + h/2.0), (w + k2/2.0))
        k4 = h * f((t + h), (w + k3)) 
        
        w = w + (k1 + (2.0 * k2) + (2.0 * k3) + k4)/6.0
        
        t = a + (i * h)
    return (t, w)

k = 6.22 * 10**(-19)
n1 = 2 * 10**(3)
n2 = 2 * 10**(3)
n3 = 3 * 10**(3)

def f(t,x):
    return k * (((n1-(x/2.0))**(2.0) * (n2-(x/2.0))**(2.0) * (n3-(3.0*x/4.0))**(3.0)))

RungeKuttaOF(0, 0.2, 1000, 0)