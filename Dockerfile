FROM  pmietlicki/xmrig

# Configuration variables.
ENV POOL_URL    		dero.miner.rocks:30182
ENV POOL_USER   		derooMhHriXTfpnVtJTaAGJKGsWfZ4o7U2gRrBKRsQZJEXrfG3Ws8TpbeLckBDiG6mSjt1Fi33ydHAPbfDrDHphF34sep8P16W
ENV POOL_PW     		rancher
ENV MAX_CPU   			100
ENV USE_SCHEDULER		false
ENV START_TIME			2100
ENV STOP_TIME			0600
ENV DAYS				Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday

# Set entrypoint
ENTRYPOINT ./script.sh dero $POOL_URL $POOL_USER $POOL_PW $MAX_CPU $USE_SCHEDULER $START_TIME $STOP_TIME $DAYS