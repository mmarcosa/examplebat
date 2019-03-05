

@echo ******************************

@echo * Instalando Nome do Servico *

@echo ******************************

@echo *

@echo * Iniciando instalacao

@echo *

echo off

 

::PARAMETROS

::Os parametros podem ser:

:: 1 - Instala o jar1 e o jar2 sem o Java

:: 2 - Instala o jar1 e o jar2 com o Java

:: 3 - Instala o jar1 sem o java

:: 4 - Instala o jar1 com o java

:: 5 - Instala o jar2 sem o java

:: 6 - Instala o jar2 com o java

 

::Variaveis

::diretorio e nome do xml

SET CONNECTORXML=path para o xml de instalacao do jar1

SET CLIENTXML=path para o xml de instalacao do jar2

 

::nome do jar

SET CONNECTORJAR=jar1

SET CLIENTJAR=jar2

 

::descricao do servico

SET CONNECTORDESC=Descricao do servico

SET CLIENTDESC=Descricao do servico

 

::nome para exibicao do servico

SET CONNECTORSERVICENAME=nome do servico

SET CLIENTSERVICENAME=nome do servico

 

::shortname do servico

SET IDCONNECTOR=shortname do servico

SET IDCLIENT=shortname do servico

 

::Modo de start do servico

SET CONNECTORSTARTMODE=Manual

SET CLIENTSTARTMODE=Manual

 

::caminho do java

SET CAMINHOJAVA=%CD%\jre1.8\bin\java

 

::executaveis de instalacao

SET CONNECTOREXE=

SET CLIENTEXE=

 

echo off

 

IF "%1" == "1" (

                              

                @echo *

                @echo Verificacoes:

                @echo *

               

                @echo apagando xml do jar1

                @echo *

                if exist %CONNECTORXML% del %CONNECTORXML%

                @echo apagando xml do jar2

                @echo *

                if exist %CLIENTXML% del %CLIENTXML%

               

                @echo apagando servico do jar1

                sc delete %IDCONNECTOR%

                @echo apagando servico do jar2

                sc delete %IDCLIENT%

               

                @echo Instalando o scope-client e o scope-connector sem o java

               

                @echo Montando xml para instalar o scope-client-na

               

                @echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %CONNECTORXML%

                @echo                 ^<service^> >> %CONNECTORXML%

                @echo                                 ^<id^>%IDCONNECTOR%^</id^> >> %CONNECTORXML%

                @echo                                 ^<^name^>%CONNECTORSERVICENAME%^</name^> >> %CONNECTORXML%

                @echo                                 ^<description^>%CONNECTORDESC%^</description^> >> %CONNECTORXML%

                @echo                                 ^<executable^>java^</executable^> >> %CONNECTORXML%

                @echo                                 ^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CONNECTORJAR%^</arguments^> >> %CONNECTORXML%

                @echo                                 ^<logmode^>rotate^</logmode^> >> %CONNECTORXML%

                @echo                                 ^<startmode^>%CONNECTORSTARTMODE%^</startmode^> >> %CONNECTORXML%

                @echo                                 ^<logpath^>%BASE%\logs^</logpath^> >> %CONNECTORXML%

                @echo                                 ^<beeponshutdown/^> >> %CONNECTORXML%

                @echo                 ^</service^> >> %CONNECTORXML%

               

                %CONNECTOREXE% install

               

                @echo Montando xml para instalar o scope-connector

                @echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %CLIENTXML%

                @echo                 ^<service^> >> %CLIENTXML%

                @echo                                 ^<id^>%IDCLIENT%^</id^> >> %CLIENTXML%

                @echo                                 ^<^name^>%CLIENTSERVICENAME%^</name^> >> %CLIENTXML%

                @echo                                 ^<description^>%CLIENTDESC%^</description^> >> %CLIENTXML%

                @echo                                 ^<executable^>java^</executable^> >> %CLIENTXML%

                @echo                                 ^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CLIENTJAR%^</arguments^> >> %CLIENTXML%

                @echo                                 ^<logmode^>rotate^</logmode^> >> %CLIENTXML%

                @echo                                 ^<startmode^>%CLIENTSTARTMODE%^</startmode^> >> %CLIENTXML%

                @echo                                 ^<logpath^>%BASE%\logs^</logpath^> >> %CLIENTXML%

                @echo                                 ^<beeponshutdown/^> >> %CLIENTXML%

                @echo                 ^</service^> >> %CLIENTXML%

 

                %CLIENTEXE% install

               

) ELSE IF "%1" == "2" (

                              

                               @echo *

                               @echo Verificacoes:

                               @echo *                            

                               @echo apagando xml do connector

                               @echo *

                               if exist %CONNECTORXML% del %CONNECTORXML%

                               @echo apagando xml do client

                               @echo *

                               if exist %CLIENTXML% del %CLIENTXML%

                              

                               @echo apagando servico do connector

                               sc delete %IDCONNECTOR%

                               @echo *

                               @echo apagando servico do client

                               sc delete %IDCLIENT%

                               @echo *

                               @echo Instalando o scope-client e o scope-connector com o java

               

                               @echo Montando xml para instalar o scope-connector

                              

                               @echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %CONNECTORXML%

                               @echo                 ^<service^> >> %CONNECTORXML%

                               @echo                                 ^<id^>%IDCONNECTOR%^</id^> >> %CONNECTORXML%

                               @echo                                 ^<^name^>%CONNECTORSERVICENAME%^</name^> >> %CONNECTORXML%

                               @echo                                 ^<description^>%CONNECTORDESC%^</description^> >> %CONNECTORXML%

                               @echo                                 ^<executable^>%CAMINHOJAVA%^</executable^> >> %CONNECTORXML%

                               @echo                                 ^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CONNECTORJAR%^</arguments^> >> %CONNECTORXML%

                               @echo                                 ^<logmode^>rotate^</logmode^> >> %CONNECTORXML%

                               @echo                                 ^<startmode^>%CONNECTORSTARTMODE%^</startmode^> >> %CONNECTORXML%

                               @echo                                 ^<logpath^>%BASE%\logs^</logpath^> >> %CONNECTORXML%

                               @echo                                 ^<beeponshutdown/^> >> %CONNECTORXML%

                               @echo                 ^</service^> >> %CONNECTORXML%

                              

                               %CONNECTOREXE% install

                              

                               @echo Montando xml para instalar o scope-client

                              

                               @echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %CLIENTXML%

                               @echo                 ^<service^> >> %CLIENTXML%

                               @echo                                 ^<id^>%IDCLIENT%^</id^> >> %CLIENTXML%

                               @echo                                 ^<^name^>%CLIENTSERVICENAME%^</name^> >> %CLIENTXML%

                               @echo                                 ^<description^>%CLIENTDESC%^</description^> >> %CLIENTXML%

                               @echo                                 ^<executable^>%CAMINHOJAVA%^</executable^> >> %CLIENTXML%

                               @echo                                 ^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CLIENTJAR%^</arguments^> >> %CLIENTXML%

                               @echo                                 ^<logmode^>rotate^</logmode^> >> %CLIENTXML%

                               @echo                                 ^<startmode^>%CLIENTSTARTMODE%^</startmode^> >> %CLIENTXML%

                               @echo                                 ^<logpath^>%BASE%\logs^</logpath^> >> %CLIENTXML%

                               @echo                                 ^<beeponshutdown/^> >> %CLIENTXML%

                               @echo                 ^</service^> >> %CLIENTXML%

                              

                               %CLIENTEXE% install

                              

  ) ELSE IF "%1" == "3" (

                                              

                                               @echo *

                                               @echo Verificacoes:

                                               @echo *

                                               @echo apagando xml do connector

                                               @echo *

                                               if exist %CONNECTORXML% del %CONNECTORXML%

 

                                               @echo apagando servico do connector

                                               sc delete %IDCONNECTOR%

                                              

                                               @echo Instalando o scope-client e o scope-connector sem o java

                                               @echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %CONNECTORXML%

                                               @echo                 ^<service^> >> %CONNECTORXML%

                                               @echo                                 ^<id^>%IDCONNECTOR%^</id^> >> %CONNECTORXML%

                                               @echo                                 ^<^name^>%CONNECTORSERVICENAME%^</name^> >> %CONNECTORXML%

                                               @echo                                 ^<description^>%CONNECTORDESC%^</description^> >> %CONNECTORXML%

                                               @echo                                 ^<executable^>java^</executable^> >> %CONNECTORXML%

                                               @echo                                 ^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CONNECTORJAR%^</arguments^> >> %CONNECTORXML%

                                               @echo                                 ^<logmode^>rotate^</logmode^> >> %CONNECTORXML%

                                               @echo                                 ^<startmode^>%CONNECTORSTARTMODE%^</startmode^> >> %CONNECTORXML%

                                               @echo                                 ^<logpath^>%BASE%\logs^</logpath^> >> %CONNECTORXML%

                                               @echo                                 ^<beeponshutdown/^> >> %CONNECTORXML%

                                               @echo                 ^</service^> >> %CONNECTORXML%

                                              

                                               %CONNECTOREXE% install

                              

                ) ELSE IF "%1" == "4" (

                                                              

                                                               @echo *

                                                               @echo Verificacoes:

                                                               @echo *

                                                               @echo apagando xml do connector

                                                               @echo *

                                                               if exist %CONNECTORXML% del %CONNECTORXML%

 

                                                               @echo apagando servico do connector

                                                               sc delete %IDCONNECTOR%

                                                              

                                                               @echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %CONNECTORXML%

                                                               @echo                 ^<service^> >> %CONNECTORXML%

                                                               @echo                                 ^<id^>%IDCONNECTOR%^</id^> >> %CONNECTORXML%

                                                               @echo                                 ^<^name^>%CONNECTORSERVICENAME%^</name^> >> %CONNECTORXML%

                                                               @echo                                 ^<description^>%CONNECTORDESC%^</description^> >> %CONNECTORXML%

                                                               @echo                                 ^<executable^>%CAMINHOJAVA%^</executable^> >> %CONNECTORXML%

                                                               @echo                                 ^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CONNECTORJAR%^</arguments^> >> %CONNECTORXML%

                                                               @echo                                 ^<logmode^>rotate^</logmode^> >> %CONNECTORXML%

                                                               @echo                                 ^<startmode^>%CONNECTORSTARTMODE%^</startmode^> >> %CONNECTORXML%

                                                               @echo                                 ^<logpath^>%BASE%\logs^</logpath^> >> %CONNECTORXML%

                                                               @echo                                 ^<beeponshutdown/^> >> %CONNECTORXML%

                                                               @echo                 ^</service^> >> %CONNECTORXML%

                                                              

                                                               %CONNECTOREXE% install

                 

                  )            ELSE IF "%1" == "5" (

 

                                                                              @echo *

                                                                              @echo Verificacoes:

                                                                              @echo *

                                                                              @echo apagando xml do client

                                                                              @echo *

                                                                              if exist %CLIENTXML% del %CLIENTXML%

 

                                                                              @echo apagando servico do client

                                                                              sc delete %IDCLIENT%

                 

                                                                              @echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %CLIENTXML%

                                                                              @echo                 ^<service^> >> %CLIENTXML%

                                                                              @echo                                 ^<id^>%IDCLIENT%^</id^> >> %CLIENTXML%

                                                                              @echo                                 ^<^name^>%CLIENTSERVICENAME%^</name^> >> %CLIENTXML%

                                                                              @echo                                 ^<description^>%CLIENTDESC%^</description^> >> %CLIENTXML%

                                                                              @echo                                 ^<executable^>java^</executable^> >> %CLIENTXML%

                                                                              @echo                                 ^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CLIENTJAR%^</arguments^> >> %CLIENTXML%

                                                                              @echo                                 ^<logmode^>rotate^</logmode^> >> %CLIENTXML%

                                                                              @echo                                 ^<startmode^>%CLIENTSTARTMODE%^</startmode^> >> %CLIENTXML%

                                                                              @echo                                 ^<logpath^>%BASE%\logs^</logpath^> >> %CLIENTXML%

                                                                              @echo                                 ^<beeponshutdown/^> >> %CLIENTXML%

                                                                              @echo                 ^</service^> >> %CLIENTXML%

                                                                             

                                                                              %CLIENTEXE% install

                               

                               ) ELSE IF "%1" == "6" (

                                                                                             

                                                                                              @echo *

                                                                                              @echo Verificacoes:

                                                                                              @echo *

                                                                                              @echo apagando xml do client

                                                                                              @echo *

                                                                                              if exist %CLIENTXML% del %CLIENTXML%

 

                                                                                              @echo apagando servico do client

                                                                                              sc delete %IDCLIENT%

                                                                             

                                                                                              @echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %CLIENTXML%

                                                                                              @echo                 ^<service^> >> %CLIENTXML%

                                                                                              @echo                                 ^<id^>%IDCLIENT%^</id^> >> %CLIENTXML%

                                                                                              @echo                                 ^<^name^>%CLIENTSERVICENAME%^</name^> >> %CLIENTXML%

                                                                                              @echo                                 ^<description^>%CLIENTDESC%^</description^> >> %CLIENTXML%

                                                                                              @echo                                 ^<executable^>%CAMINHOJAVA%^</executable^> >> %CLIENTXML%

                                                                                              @echo                                 ^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CLIENTJAR%^</arguments^> >> %CLIENTXML%

                                                                                              @echo                                 ^<logmode^>rotate^</logmode^> >> %CLIENTXML%

                                                                                              @echo                                 ^<startmode^>%CLIENTSTARTMODE%^</startmode^> >> %CLIENTXML%

                                                                                              @echo                                 ^<logpath^>%BASE%\logs^</logpath^> >> %CLIENTXML%

                                                                                              @echo                                 ^<beeponshutdown/^> >> %CLIENTXML%

                                                                                              @echo                 ^</service^> >> %CLIENTXML%

 

                                                                                              %CLIENTEXE% install     

                                                                             

                                 ) ELSE (

                                                              

                                                               @echo parametro invalido

                                                               @echo o parametro pode ser:

                                                               @echo 1 - Instala o Scope-Connector e o Scope-Client-NA sem o Java

                                                               @echo 2 - Instala o Scope-Connector e o Scope-Client-Na com o Java

                                                               @echo 3 - Instala o Scope-Connector sem o java

                                                               @echo 4 - Instala o Scope-Connector com o java

                                                               @echo 5 - Instala o Scope-Client-NA sem o java

                                                               @echo 6 - Instala o Scope-Client-NA com o java

                                                              

                                               )
