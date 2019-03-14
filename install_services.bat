@echo ********************************
@echo * Instalando jars como servico *
@echo ********************************
@echo *
@echo * Iniciando instalacao
@echo *
echo off

::PARAMETROS
::Os parametros podem ser:
:: 1 - Instala o jar2 e o jar1 sem o Java
:: 2 - Instala o jar2 e o jar1 com o Java
:: 3 - Instala o jar2 sem o java
:: 4 - Instala o jar2 com o java
:: 5 - Instala o jar1 sem o java
:: 6 - Instala o jar1 com o java

::Variaveis
::diretorio e nome do xml
SET JAR2XML=jar2\jar2.xml
SET JAR1XML=jar1\jar1.xml

::nome do jar
SET JAR2JAR=jar2.jar
SET JAR1JAR=jar1.jar

::descricao do servico
SET JAR2DESC=Scope Connector 
SET JAR1DESC=jar1 

::nome para exibicao do servico
SET JAR2SERVICENAME=jar2
SET JAR1SERVICENAME=jar1

::shortname do servico
SET IDJAR2=jar2
SET IDJAR1=jar1

::Modo de start do servico
SET JAR2STARTMODE=Manual
SET JAR1STARTMODE=Manual

::caminho do java
SET CAMINHOJAVA=%CD%\jre1.8\bin\java

::executaveis de instalacao
SET JAR2EXE=jar2\jar2.exe
SET JAR1EXE=jar1\jar1.exe

echo off

IF "%1" == "1" (
		
	@echo *
	@echo Verificacoes:
	@echo *
	
	@echo apagando xml do connector
	@echo *
	if exist %JAR2XML% del %JAR2XML%
	@echo apagando xml do client
	@echo *
	if exist %JAR1XML% del %JAR1XML%
	
	@echo apagando servico do connector
	sc delete %JAR2XML%
	@echo apagando servico do client
	sc delete %JAR1XML%
	
	@echo Instalando o jar1 e o jar2 sem o java
	
	@echo Montando xml para instalar o jar1
	
	@echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %JAR2XML%
	@echo 	^<service^> >> %JAR2XML%
	@echo 		^<id^>%IDJAR2%^</id^> >> %JAR2XML%
	@echo 		^<^name^>%JAR2SERVICENAME%^</name^> >> %JAR2XML%
	@echo 		^<description^>%JAR2DESC%^</description^> >> %JAR2XML%
	@echo 		^<executable^>java^</executable^> >> %JAR2XML%
	@echo 		^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CONNECTORJAR%^</arguments^> >> %JAR2XML%
	@echo 		^<logmode^>rotate^</logmode^> >> %JAR2XML%
	@echo 		^<startmode^>%JAR2STARTMODE%^</startmode^> >> %JAR2XML%
	@echo 		^<logpath^>%BASE%\logs^</logpath^> >> %JAR2XML%
	@echo 		^<beeponshutdown/^> >> %JAR2XML%
	@echo 	^</service^> >> %JAR2XML%
	
	%JAR2EXE% install
	
	@echo Montando xml para instalar o jar2
	@echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %JAR1XML%
	@echo 	^<service^> >> %JAR1XML%
	@echo 		^<id^>%IDJAR1%^</id^> >> %JAR1XML%
	@echo 		^<^name^>%JAR1SERVICENAME%^</name^> >> %JAR1XML%
	@echo 		^<description^>%JAR1DESC%^</description^> >> %JAR1XML%
	@echo 		^<executable^>java^</executable^> >> %JAR1XML%
	@echo 		^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CLIENTJAR%^</arguments^> >> %JAR1XML%
	@echo 		^<logmode^>rotate^</logmode^> >> %JAR1XML%
	@echo 		^<startmode^>%JAR1STARTMODE%^</startmode^> >> %JAR1XML%
	@echo 		^<logpath^>%BASE%\logs^</logpath^> >> %JAR1XML%
	@echo 		^<beeponshutdown/^> >> %JAR1XML%
	@echo 	^</service^> >> %JAR1XML%

	%JAR1EXE% install
	
) ELSE IF "%1" == "2" (
		
		@echo *
		@echo Verificacoes:
		@echo *		
		@echo apagando xml do jar2
		@echo *
		if exist %JAR2XML% del %JAR2XML%
		@echo apagando xml do jar1
		@echo *
		if exist %JAR1XML% del %JAR1XML%
		
		@echo apagando servico do jar2
		sc delete %IDJAR2%
		@echo *
		@echo apagando servico do jar1
		sc delete %IDJAR1%
		@echo *
		@echo Instalando o jar1 e o jar2 com o java
	
		@echo Montando xml para instalar o jar2
			
		@echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %JAR2XML%
		@echo 	^<service^> >> %JAR2XML%
		@echo 		^<id^>%IDJAR2%^</id^> >> %JAR2XML%
		@echo 		^<^name^>%JAR2SERVICENAME%^</name^> >> %JAR2XML%
		@echo 		^<description^>%JAR2DESC%^</description^> >> %JAR2XML%
		@echo 		^<executable^>%CAMINHOJAVA%^</executable^> >> %CLIENTXML%
		@echo 		^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CONNECTORJAR%^</arguments^> >> %JAR2XML%
		@echo 		^<logmode^>rotate^</logmode^> >> %JAR2XML%
		@echo 		^<startmode^>%JAR2STARTMODE%^</startmode^> >> %JAR2XML%
		@echo 		^<logpath^>%BASE%\logs^</logpath^> >> %JAR2XML%
		@echo 		^<beeponshutdown/^> >> %JAR2XML%
		@echo 	^</service^> >> %JAR2XML%
		
		%JAR2EXE% install
		
		@echo Montando xml para instalar o jar2
		@echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %JAR1XML%
		@echo 	^<service^> >> %JAR1XML%
		@echo 		^<id^>%IDJAR1%^</id^> >> %JAR1XML%
		@echo 		^<^name^>%JAR1SERVICENAME%^</name^> >> %JAR1XML%
		@echo 		^<description^>%JAR1DESC%^</description^> >> %JAR1XML%
		@echo 		^<executable^>%CAMINHOJAVA%^</executable^> >> %CLIENTXML%
		@echo 		^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CLIENTJAR%^</arguments^> >> %JAR1XML%
		@echo 		^<logmode^>rotate^</logmode^> >> %JAR1XML%
		@echo 		^<startmode^>%JAR1STARTMODE%^</startmode^> >> %JAR1XML%
		@echo 		^<logpath^>%BASE%\logs^</logpath^> >> %JAR1XML%
		@echo 		^<beeponshutdown/^> >> %JAR1XML%
		@echo 	^</service^> >> %JAR1XML%

		%JAR1EXE% install
		
		
		
		
  ) ELSE IF "%1" == "3" (
			
			@echo *
			@echo Verificacoes:
			@echo *
			@echo apagando xml do jar2
			@echo *
			if exist %JAR2XML% del %JAR2XML%

			@echo apagando servico do jar2
			sc delete %IDJAR2%
					
			@echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %JAR2XML%
			@echo 	^<service^> >> %JAR2XML%
			@echo 		^<id^>%IDJAR2%^</id^> >> %JAR2XML%
			@echo 		^<^name^>%JAR2SERVICENAME%^</name^> >> %JAR2XML%
			@echo 		^<description^>%JAR2DESC%^</description^> >> %JAR2XML%
			@echo 		^<executable^>java^</executable^> >> %JAR2XML%
			@echo 		^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CONNECTORJAR%^</arguments^> >> %JAR2XML%
			@echo 		^<logmode^>rotate^</logmode^> >> %JAR2XML%
			@echo 		^<startmode^>%JAR2STARTMODE%^</startmode^> >> %JAR2XML%
			@echo 		^<logpath^>%BASE%\logs^</logpath^> >> %JAR2XML%
			@echo 		^<beeponshutdown/^> >> %JAR2XML%
			@echo 	^</service^> >> %JAR2XML%
					
			%CONNECTOREXE% install
		
	) ELSE IF "%1" == "4" (
				
				@echo *
				@echo Verificacoes:
				@echo *
				@echo apagando xml do jar2
				@echo *
				if exist %JAR2XML% del %JAR2XML%

				@echo apagando servico do jar2
				sc delete %IDJAR2%
				

				@echo Montando xml para instalar o jar2
				@echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %JAR1XML%
				@echo 	^<service^> >> %JAR1XML%
				@echo 		^<id^>%IDJAR1%^</id^> >> %JAR1XML%
				@echo 		^<^name^>%JAR1SERVICENAME%^</name^> >> %JAR1XML%
				@echo 		^<description^>%JAR1DESC%^</description^> >> %JAR1XML%
				@echo 		^<executable^>%CAMINHOJAVA%^</executable^> >> %CLIENTXML%
				@echo 		^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CLIENTJAR%^</arguments^> >> %JAR1XML%
				@echo 		^<logmode^>rotate^</logmode^> >> %JAR1XML%
				@echo 		^<startmode^>%JAR1STARTMODE%^</startmode^> >> %JAR1XML%
				@echo 		^<logpath^>%BASE%\logs^</logpath^> >> %JAR1XML%
				@echo 		^<beeponshutdown/^> >> %JAR1XML%
				@echo 	^</service^> >> %JAR1XML%
						
				%CONNECTOREXE% install
	  
	  )	ELSE IF "%1" == "5" (

					@echo *
					@echo Verificacoes:
					@echo *
					@echo apagando xml do jar1
					@echo *
					if exist %JAR1XML% del %JAR1XML%

					@echo apagando servico do jar1
					sc delete %IDJAR1%
	  
					@echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %JAR2XML%
					@echo 	^<service^> >> %JAR2XML%
					@echo 		^<id^>%IDJAR2%^</id^> >> %JAR2XML%
					@echo 		^<^name^>%JAR2SERVICENAME%^</name^> >> %JAR2XML%
					@echo 		^<description^>%JAR2DESC%^</description^> >> %JAR2XML%
					@echo 		^<executable^>java^</executable^> >> %JAR2XML%
					@echo 		^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CONNECTORJAR%^</arguments^> >> %JAR2XML%
					@echo 		^<logmode^>rotate^</logmode^> >> %JAR2XML%
					@echo 		^<startmode^>%JAR2STARTMODE%^</startmode^> >> %JAR2XML%
					@echo 		^<logpath^>%BASE%\logs^</logpath^> >> %JAR2XML%
					@echo 		^<beeponshutdown/^> >> %JAR2XML%
					@echo 	^</service^> >> %JAR2XML%
	
					%JAR1EXE% install
		
		) ELSE IF "%1" == "6" (
						
						@echo *
						@echo Verificacoes:
						@echo *
						@echo apagando xml do jar1
						@echo *
						if exist %JAR1XML% del %JAR1XML%

						@echo apagando servico do jar1
						sc delete %IDJAR1%
					
						@echo Montando xml para instalar o jar1
						
						@echo ^<^?xml version="1.0" encoding="UTF-8"?^> >> %JAR1XML%
						@echo 	^<service^> >> %JAR1XML%
						@echo 		^<id^>%IDJAR1%^</id^> >> %JAR1XML%
						@echo 		^<^name^>%JAR1SERVICENAME%^</name^> >> %JAR1XML%
						@echo 		^<description^>%JAR1DESC%^</description^> >> %JAR1XML%
						@echo 		^<executable^>%CAMINHOJAVA%^</executable^> >> %CLIENTXML%
						@echo 		^<arguments^>-Dlog4j.configuration=file:".\log4j.properties" -jar %CLIENTJAR%^</arguments^> >> %JAR1XML%
						@echo 		^<logmode^>rotate^</logmode^> >> %JAR1XML%
						@echo 		^<startmode^>%JAR1STARTMODE%^</startmode^> >> %JAR1XML%
						@echo 		^<logpath^>%BASE%\logs^</logpath^> >> %JAR1XML%
						@echo 		^<beeponshutdown/^> >> %JAR1XML%
						@echo 	^</service^> >> %JAR1XML%

						%JAR1EXE% install	
					
		  ) ELSE (
				
				@echo parametro invalido
				@echo o parametro pode ser:
				@echo 1 - Instala o jar2 e o jar1 sem o Java
				@echo 2 - Instala o jar2 e o jar1 com o Java
				@echo 3 - Instala o jar2 sem o java
				@echo 4 - Instala o jar2 com o java
				@echo 5 - Instala o jar1 sem o java
				@echo 6 - Instala o jar1 com o java
				
			)