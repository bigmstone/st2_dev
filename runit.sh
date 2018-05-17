make requirements; source virtualenv/bin/activate; cd st2client; python setup.py develop; cd ../; ./tools/launchdev.sh stop; ./tools/launchdev.sh start; st2 run test.echoer action_input='bob'
