import subprocess
import json
from st2actions.runners.pythonrunner import Action


class Action(Action):
    def run(self):
        cmds = [
            [
                "head",
                "-c",
                "131072",
                "/dev/urandom"
            ],
            [
                "base64",
                "-w",
                "0"
            ],
            [
                "head",
                "-c",
                "131072"
            ]
        ]

        def _iter_cmd(cmds, previous=None):
            cmd = cmds.pop(0)
            process = subprocess.Popen(
                cmd,
                stdout=subprocess.PIPE,
                stdin=previous,
            )
            if cmds:
                return _iter_cmd(cmds, process.stdout)

            return process.stdout.read()

        output = {
            'result': _iter_cmd(cmds)
        }

        return output
