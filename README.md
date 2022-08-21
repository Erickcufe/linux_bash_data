# linux_bash_data


```mermaid
graph LR
A[Linux] -- Cloud/Desktop --> B((VM))
A -- Docker/Kubernets --> C(Container)
A -- Laptop --> D{Hardware}
```

## VM

Se pueden utilizar programas como [Parallels](https://www.parallels.com/mx/pd/general/?gclid=Cj0KCQjw_7KXBhCoARIsAPdPTfjUC4p6a_qPQ72dvOrr_f14ls4zR-ecWaQdTdTyCkokc9W3IiXQJ8gaAsODEALw_wcB), para elegir sistemas operativos y trabajar en ellos a través de la nube. 

Otra opción para trabajar bash en la nube son los servicios de [Amazon](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3FhashArgs%3D%2523%26isauthcode%3Dtrue%26nc2%3Dh_ct%26src%3Dheader-signin%26state%3DhashArgsFromTB_us-west-1_3e1f6a32a4275b6f&client_id=arn%3Aaws%3Asignin%3A%3A%3Aconsole%2Fcanvas&forceMobileApp=0&code_challenge=Z5G7MeEi2yoHGpSMItI7feahOjznNCoHnC0fUuN7ZZk&code_challenge_method=SHA-256), a partir de aquí podemos crear entornos con distintos sistemas operativos. 

Otra alternativa es tener una cuenta premium para acceder a **GitHub Codespace**. 

## Docker

Al tener docker podemos tener acceso a distitos entornos contenidos de distintos sistemas operativos, y acceder a Kubernets.

> Kubernetes es un sistema de código libre para la automatización del despliegue, ajuste de escala y manejo de aplicaciones en contenedores que fue originalmente diseñado por Google y donado a la Cloud Native Computing Foundation. Soporta diferentes entornos para la ejecución de contenedores, incluido Docker.

# Comandos útiles

- `mdfind` para encontrar archivos a traves de una palabra clave.
- `chmod +x` para hacer ejecutables los archivos en caso de no tener permisos. 

## Hora y fechas:

- `cal` abre un calendario
- `date` fecha y hora actual

## Uso de disco o tamaño de archivos:

- `df -h` despliega los discos y su uso de memoria.
- `du -sg *` despliega el tamaño de los archivos del directorio.

> Para conocer la lista de todos los comandos disponibles, se localizan en el directorio `/bin/` y con `ls -l` los puedes desplegar. 

# Usando Shell

## Explorar

- `pwd` conocer el path 
- `ls -lah`ver la lista de archivos con permisos
- `cd ~` para regresar al home

## Ver archivos

- `less`
- `cat`
- `wc -l /etc/passwd` para ver el numero de lineas de un archivo

## Modificar archivos y directorios

- `touch newfile.txt` para generar nuevos archivos.
- `mkdir newdir` crear directorios
- `mkdir -p moredir/dir1/dir2` para crear todo el PATH
- `rm -rf moredir` para eliminar todo el directorio 
- `mv` comando para mover archivos; también funciona para renombrar un archivo

## Procesos

- `ps` para monitorear procesos
- `ps -ef | grep spotify` para buscar un proceso en especifico
- `jobs` para ver los procesos detenidos o pausados
- `Ctrl` + `c` para detener procesos
- `Ctrl` + `z` para pausar procesos
- `fg 1` para reanudar procesos que se dejaron en pausa, y encaso de que los procesos esten con `&` en el background, con `fg 1` se vuelven a la terminal para poder ser pausados o eliminados.


> Una forma útil de aprender bash es checar los dockers de configuración de los lenguajes de programación más famosos, como por ejemplo [python](https://hub.docker.com/_/python)

# Pipelines

El simbolo del pipe es `|`, el de output del pipelie es `>`. Para hacer un pipe pero condicionado a qué primero se ejecute el código anterior, se usa `&&`.

Ejemplo: `ls -l /bin && touch newfile.txt`

Ejemplos:

```
STR=$'1. This is a line\n2. This is a line\n3. This is a line.'
echo "$STR" > lines.txt

cat lines.txt | sort -r 

cat lines.txt | sort -r | less

cat lines.txt | grep 3 > match.txt

```

Para agregar texto a un archivo. Con el simbolo `>>` se agrega en vez de sobreescribir. 

```
echo "something" > append.txt
echo "overwrite" > append.txt

echo "another thing" >> append.txt
```

Para echar a la basura el output se usa el siguiente comando `2>`

```
ls -l /wrong/path 2> /dev/null
```

Para ver elementos finales o iniciales de un archivo

```
head -f /PATH/file.txt
head -n 4 /PATH/file.txt

tail -n 4 /PATH/file.txt
```

Para navegar por el historial con pipes

```
history | less
history | grep tail
```
 Con el comando `!`seguido de la linea del historial que quieras volver a ejecutar. **Ejemplo:** `!56` se vuelve a ejecutar el código de la linea 56 del historial.  
 
 Para correr el último código del historial se usa el comando `!!`.

# SSH

```mermaid
graph LR
A[Client] -- key --> B[Server/Cloud]
C[Tunnel Ports] -- Key --> D(Remote 8080)
E[Git] -- Key --> F[GitHub]
```

Para crear una llave pública **ssh** se usa el siguiente código:

```
ssh-keygen -t rsa
```

Despues usar `cat /home/ec2-user/.ssh/id_rsa.pub` y copiar a GitHub.


# Configuración .bashrc y .zshrc

Para configurar el `.bashrc` se accede con el vim o nvim. Ahi se pueden añadir Aliases, y establecer variables asi como entornos. `vim ~/.bashrc` ó `nvim ~/.bashrc`.

Para instalar en la terminal ssh la [zsh](https://ohmyz.sh), se usa **on-my-zsh**, Mac ya tiene por default esta actualización. En linux se usa el siguiente comando para instalarla: `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`.

Para modificar la configuración de `zsh` se usa `vim ~/.zshrc`, ahi se pueden agregar [temas](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) y [plugins](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins).

Existen comando exclusivos para MacOS, se pueden ver con `diskutil`. 


# Variables de Shell

Para crear una variable en Shell se utiliza `export`.

Ejemplo:

```
export FOOD="apple"
echo $FOOD
echo "I love" $FOOD
```

Se pueden declarar variables simplemente de entorno, pero siempre será mejor declararlas con `export`. Estas variables también se pueden guardar en el archivo de configuración `.basrc` ó `.zshrc`.

Para generar **entornos** personalizados por proyecto se puede hacer lo siguiente:

1. Crear un archivo `.sh` en la carpeta de un proyecto especifico. `touch projectENV.sh`
2. Modificar ese archivo. `nvim projectENV.sh`
3. Agregar al archivo las variables y las modificaciones que se deseen hacer en ese entorno. `export SECRET="ABCD"`.
4. Modificar el archivo de configuración `.zshrc` o `.bashrc`. `nvim ~/.zshrc`.
5. Agregar al archivo el alias al PATH donde se localiza `projectENV.sh` como por ejemplo: `alias myproject="cd /Users/erickCuevas/Documents/cursera/linux_bash_data/project && source /Users/erickCuevas/Documents/cursera/linux_bash_data/project/projENV.sh" 
6. Ahora si, al darle source a nuestro `.zshrc` modificado se puede acceder al entorno que creamos para el proyecto especifico al solo teclar `myproject`. 

# Standard Streams (flujos estandar)

EStos flujos en UNIX se utilizan para filtrar y procesar los datos, y ver los errores en el camino. 

## Usando Standard Out

El comando `>>` agrega al output que ya existe. En cambio el comando `>` sobreescribe. 

Para contar elementos unicos se utiliza el siguiente ejemplo:

```
echo -e "Apple\nCarrot\nBanana" | sort | unique -c
``` 

Para encontrar patrones de caracteres se utiliza:

```
echo -e "Apple\nCarrot\nBanana" | sort | unique -c | grep Apple

ps -ef | grep python
```

Para revertir el orden de un caracter se utiliza lo siguiente:

```
echo -1993 | rev
```

## Usando Standard In

Para esblecer inputs se puede utilizar `read -p 'File: ' FILENAME` o `less < fruit.txt`. 

# Usando Standard Error

**Crear error**

```
ls -l /var/FAKEDIR
```

**Escribiendo el error a un archivo**

```
ls -l /var/FAKEDIR 2> error.txt

# O para agregar los errores

ls -l /var/FAKEDIR 2>> error.txt

```

**Eliminar el error**

```
ls -l /var/FAKEDIR 2> /dev/null
```
