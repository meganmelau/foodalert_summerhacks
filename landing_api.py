import flask
from flask import request, jsonify
import sqlite3

app = flask.Flask(__name__)
app.config["DEBUG"] = True

def dict_factory(cursor, row):
    d = {}
    for idx, col in enumerate(cursor.description):
        d[col[0]] = row[idx]
    return d

@app.route('/api/v1/test2', methods=['GET'])
def api_all():
    conn = sqlite3.connect('Data.sql')
    conn.row_factory = dict_factory
    cur = conn.cursor()
    all_books = cur.execute('SELECT * FROM restaurants;').fetchall()

    return jsonify(all_books)

@app.route('/', methods=['GET'])
def home():
    return '''<h1>Summerhacks Test</h1>
<p>Depending on what you add to the url 'http://127.0.0.1:5000/' there should be changes to what shows</p>'''



@app.errorhandler(404)
def page_not_found(e):
    return "<h1>404</h1><p>The resource could not be found.</p>", 404

# Main
@app.route('/api/v1/test', methods=['GET'])
def api_filter():
    query_parameters = request.args

    id = query_parameters.get('id')
    # published = query_parameters.get('published')
    # author = query_parameters.get('author')

    query = "SELECT * FROM restaurants WHERE <column=match>"
    to_filter = []

    if id:
        query += ' id=? AND'
        to_filter.append(id)

    # if author:
    #     query += ' author=? AND'
    #     to_filter.append(author)
    # if not (id or published or author):
    #     return page_not_found(404)

    query = query[:-2] + ';' # Might be wrong here

    conn = sqlite3.connect('Data.sql')
    conn.row_factory = dict_factory
    cur = conn.cursor()

    results = cur.execute(query, to_filter).fetchall()

    return jsonify(results)

app.run()