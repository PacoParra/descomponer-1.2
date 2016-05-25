# descomponer-1.2
Nuevas funciones para el package descomponer
TD.- Datos para crear un data.frame con los niveles de significación para el test de Durbin(1969):
DURBIN, J., "Tests for Serial Correlation in Regression Analysis based on the Periodogram ofLeast-Squares Residuals," Biometrika, 56, (No. 1, 1969), 1-15.
Función rdf (a,b.significance)
Realiza la regresión en el dominio de la frecuencia de los vectores "a" y "b",seleccionando las frecuencias más relevantes a partir del co-espectro.
El algoritmo de calculo se realiza en las siguentes fases:

a) Calcula el co-espectro de la serie "x" e "y"

Sea $x$ un vector n x 1 el modelo transformado en el dominio de la frecuencia esta dado por:

$\hat x= Wx$

Sea $y$ un vector n x 1 el modelo transformado en el dominio de la frecuencia esta dado por:

$\hat y= Wy$


Denominando  $p_j$ el ordinal del cross-periodograma de $\hat x$ y $\hat y$  en la frecuencia $\lambda_j=2\pi j/n$, y $\hat x_j$ el j-th elemento de $\hat x$ y $\hat y_j$ el j-th elemento de $\hat y$, entonces

$$ \left\lbrace
\begin{array}{ll}
p_j=\hat x_{2j}\hat y_{2j}+\hat x_{2j+1}\hat y_{2j+1} & \forall   j = 1,...\frac{n-1}{2}\\
p_j=\hat x_{2j}\hat y_{2j}& \forall j = \frac{n}{2}-1
\end{array}
\right .
$$

$$p_0=\hat x_{1}\hat y_{1}$$

b) Ordena el co-espectro en base al valor absoluto de $|p_j|$ y genera un índice en base a ese orden para cada coeficiente de fourier.  

c) Calcula la matriz $Wx_tI_nW^T$ y la ordena en base a el indice anterior.

d) Obtiene $\dot e=WI_nW^T\dot u$, incluyendo el vector correspondiente al parámetro constante, $(1,0,...0)^n$, y calucula el modelo utilizando los dos primeros regresores de la matriz $Wx_tI_nW^T$ reordenada y ampliadas, calcula el modelo para los 4 primeros, para los 6 primeros, hasta completar los $n$ regresores de la matriz.

e) Realiza el test de durbin a los modelos estimados, y selecciona aquellos en donde los $e_t=W^T\dot e$ están dentro de las bandas elegidas a los niveles de significación $\alpha=0.1;0.05;0.025;0.01;0.005$. 

f) De todos ellos elige aquel que tiene menos regresores. Si no encuentra modelo ofrece la solución MCO al modelo de regresión lineal simple. 

