import flask
import os

app = flask.Flask(__name__)
app.config["DEBUG"] = True


@app.route('/append_ct_dataset/<path_1>/<path_2>', methods=['POST'])
def get_product(path_1, path_2):
    return os.path.join(str(path_1), str(path_2))

app.run()