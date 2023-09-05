@echo off

echo "Bem vindo ao Script de automatizacao de instaladores!"
echo "abaixo, voce definira sua configuracoes"
echo "> Se sua instalacao for local, digite 1"
echo "> Se sua instalacao for via rede, digite 2"
echo 
set /p instalacao=Digite sua opcao:
set origem=%CD%
set destino=C:\checklist\

if %instalacao% equ 1 (
	REM se a instalacao for local:
	
    echo Instalacao definida 1
	set instalacao=1
	echo Copiando arquivos para C:\
	cd C:\checklist\
	
	if not errorlevel 1 (
		echo "Diretorio C:\checklist encontrado."
			cd C:\checklist\
			copy "%origem%\*.*" "%destino%" /Y /S
	) else (
			mkdir C:\checklist\
			echo "Diretorio C:\checklist criado."
			copy "%origem%\*.*" "%destino%" 
    )
	
	REM instalacao via rede
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


pause
