@echo off

echo "Bem vindo ao Script de automatizacao de instaladores!"
echo "abaixo, voce definira sua configuracoes"
echo "> Se sua instalacao for local, digite 1"
echo "> Se sua instalacao for via rede, digite 2"
echo  > configurations.txt

set /p instalacao=Digite sua opcao:
set origem=%CD%
set destino=C:\checklist\

if %instalacao% equ 1 (
	REM se a instalacao for local:
	
    echo Instalacao definida 1
	set instalacao=1
	echo Copiando arquivos para %destino%
	cd C:\checklist\
	
	if not exist %destino% (
        mkdir %destino%
        echo "Diretorio %destino% criado."
    ) else (
        echo "Diretorio %destino% encontrado."
    )

    if exist %destino% (
        cd %destino%
        copy "%origem%\*.*" /Y
    )
	
    echo Arquivos e pastas copiados para %destino%
	REM area de logs:
	echo modo_instalacao:%instalacao% > configuracoes.txt
	echo local_instalacao:%destino% >> configuracoes.txt
	
) else (
    if %instalacao% equ 2 (
        echo Instalacao definida 2
		set instalacao=2
		set /p localserver=Digite o endereco ip do servidor:
		echo modo.de.instalacao: %instalacao%
		pushd %localserver%
		copy "%localserver%\*.*" "%destino%"
		popd
		if not errorlevel 1 (
			echo "Arquivos copiados com sucesso."
			
		) else (
				echo "Falha ao copiar arquivos."
		  )	
    ) else (
        echo Opcao invalida
		exit /b
    )
)

REM chamar aqui o V7

pause
