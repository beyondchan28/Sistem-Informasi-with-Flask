from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL

app = Flask(__name__)
app.secret_key = 'flash message'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'metodesaw'

mysql = MySQL(app)

@app.route('/weight')
def weight():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM Weight")
    data = cur.fetchall()
    cur.close()
    
    return render_template('weight.html', weight = data)

@app.route('/weight/insert', methods=['POST'])
def weight_insert():
    if request.method == 'POST':
        flash("Data Inserted Succesfully")
        no = request.form['no']
        bencana = request.form['bencana']
        alt = request.form['alt']
        kriteria = request.form['kriteria']


        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO weight (id_weight, bencana, alternatif, kriteria) VALUES (%s, %s,  %s,  %s)", (no, bencana, alt, kriteria))
        mysql.connection.commit()
        return redirect(url_for('weight'))


@app.route('/weight/method/<string:alt>/<string:kriteria>')
def method(alt, kriteria):
    cur = mysql.connection.cursor()
    cur.execute("""SELECT nmalternatif, nmkriteria, value, keterangan, normalisasi, prarangking FROM vprarangking
                WHERE idalternatif= %s AND idkriteria = %s""", (alt, kriteria))
    data = cur.fetchall()
    cur.close()
    
    cur1 = mysql.connection.cursor()
    cur1.execute("""SELECT nmalternatif, nmkriteria, value, keterangan, normalisasi_w, pangkat FROM wp_pangkat
                WHERE idalternatif= %s AND idkriteria = %s""", (alt, kriteria))
    data1 = cur1.fetchall()
    cur1.close()
    
    cur2 = mysql.connection.cursor()
    cur2.execute("""SELECT nmalternatif, nmkriteria, value, keterangan, normalisasi, terbobot FROM topsis_terbobot
                WHERE idalternatif= %s AND idkriteria = %s""", (alt, kriteria))
    data2 = cur2.fetchall()
    cur2.close()
    
    cur3 = mysql.connection.cursor()
    cur3.execute("""SELECT nmalternatif, nmkriteria, value, keterangan, pra, normalisasi, normalisasibobot FROM multimoora_3
                WHERE idalternatif= %s AND idkriteria = %s""", (alt, kriteria))
    data3 = cur3.fetchall()
    cur3.close()
    return render_template('method.html', saw = data, wp = data1, topsis = data2, moora = data3)


@app.route('/weight/delete/<string:id>', methods=['GET'])
def wight_delete(id):
    flash("Data Deleted Succesfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM weight WHERE id_weight = %s", (id))
    mysql.connection.commit()
    return redirect(url_for('weight'))

@app.route('/weight/update', methods=['POST', 'GET'])
def weight_update():
    if request.method == 'POST':
        no = request.form['no']
        bencana = request.form['bencana']
        alt = request.form['alt']
        kriteria = request.form['kriteria']

        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE weight
        SET bencana=%s, alternatif = %s, kriteria = %s
        WHERE id_weight = %s
        """, (bencana, alt, kriteria, no))
        flash("Data Updated Succesfully")
        mysql.connection.commit()
        return redirect(url_for('weight'))

@app.route('/')
def index():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM alternatif")
    data = cur.fetchall()
    cur.close()
    return render_template('index.html', tabel = data )


@app.route('/insert', methods=['POST'])
def insert():
    if request.method == 'POST':
        flash("Data Inserted Succesfully")
        no = request.form['no']
        nm = request.form['nm']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO alternatif (idalternatif, nmalternatif) VALUES (%s, %s)", (no, nm))
        mysql.connection.commit()
        return redirect(url_for('index'))

@app.route('/update', methods=['POST', 'GET'])
def update():
    if request.method == 'POST':
        no = request.form['no']
        nm = request.form['nm']

        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE alternatif
        SET nmalternatif=%s
        WHERE idalternatif = %s
        """, (nm, no))
        flash("Data Updated Succesfully")
        mysql.connection.commit()
        return redirect(url_for('index'))

@app.route('/delete/<string:id>', methods=['GET'])
def delete(id):
    flash("Data Deleted Succesfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM alternatif WHERE idalternatif = %s", (id))
    mysql.connection.commit()
    return redirect(url_for('index'))

#kriteria form logic
@app.route('/kriteria')
def kriteria():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM kriteria")
    data = cur.fetchall()
    cur.close()
    return render_template('kriteria.html', tabel = data )


@app.route('/kriteria/insert', methods=['POST'])
def kriteria_insert():
    if request.method == 'POST':
        flash("Data Inserted Succesfully")
        no = request.form['no']
        nm = request.form['nm']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO kriteria (idkriteria, nmkriteria) VALUES (%s, %s)", (no, nm))
        mysql.connection.commit()
        return redirect(url_for('kriteria'))

@app.route('/kriteria/update', methods=['POST', 'GET'])
def kriteria_update():
    if request.method == 'POST':
        no = request.form['no']
        nm = request.form['nm']

        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE kriteria
        SET nmkriteria=%s
        WHERE idkriteria = %s
        """, (nm, no))
        flash("Data Updated Succesfully")
        mysql.connection.commit()
        return redirect(url_for('kriteria'))

@app.route('/kriteria/delete/<string:id>', methods=['GET'])
def kriteria_delete(id):
    flash("Data Deleted Succesfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM kriteria WHERE idkriteria = %s", (id))
    mysql.connection.commit()
    return redirect(url_for('kriteria'))

#logic bobot form
@app.route('/bobot') 
def bobot():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM bobot")
    data = cur.fetchall()
    cur.close()
    return render_template('bobot.html', tabel = data )


@app.route('/bobot/insert', methods=['POST'])
def bobot_insert():
    if request.method == 'POST':
        flash("Data Inserted Succesfully")
        no = request.form['no']
        nokr = request.form['nokr']
        value = request.form['value']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO bobot (idbobot, idkriteria, value) VALUES (%s, %s, %s)", (no, nokr, value))
        mysql.connection.commit()
        return redirect(url_for('bobot'))

@app.route('/bobot/update', methods=['POST', 'GET'])
def bobot_update():
    if request.method == 'POST':
        no = request.form['no']
        nokr = request.form['nokr']
        value = request.form['value']

        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE bobot
        SET idkriteria=%s, value=%s
        WHERE idbobot = %s
        """, (nokr, value, no))
        flash("Data Updated Succesfully")
        mysql.connection.commit()
        return redirect(url_for('bobot'))

@app.route('/bobot/delete/<string:id>', methods=['GET'])
def bobot_delete(id):
    flash("Data Deleted Succesfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM bobot WHERE idbobot = %s", (id))
    mysql.connection.commit()
    return redirect(url_for('bobot'))

#logic skala for

@app.route('/skala')
def skala():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM skala")
    data = cur.fetchall()
    cur.close()
    return render_template('skala.html', tabel = data )


@app.route('/skala/insert', methods=['POST'])
def skala_insert():
    if request.method == 'POST':
        flash("Data Inserted Succesfully")
        no = request.form['no']
        val = request.form['val']
        ket = request.form['ket']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO skala (idskala, skala, keterangan) VALUE (%s, %s, %s)", (no, val, ket))
        mysql.connection.commit()
        return redirect(url_for('skala'))

@app.route('/skala/update', methods=['POST', 'GET'])
def skala_update():
    if request.method == 'POST':
        no = request.form['no']
        val = request.form['val']
        ket = request.form['ket']

        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE skala
        SET skala=%s, ket=%s
        WHERE idskala = %s
        """, (val, ket, no))
        flash("Data Updated Succesfully")
        mysql.connection.commit()
        return redirect(url_for('skala'))

@app.route('/skala/delete/<string:id>', methods=['GET'])
def skala_delete(id):
    flash("Data Deleted Succesfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM skala WHERE idskala = %s", (id))
    mysql.connection.commit()
    return redirect(url_for('skala'))

#logic matrix form
@app.route('/matrix')
def matrix():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM matrixkeputusan")
    data = cur.fetchall()
    cur.close()
    return render_template('matrix.html', tabel = data )


@app.route('/matrix/insert', methods=['POST'])
def matrix_insert():
    if request.method == 'POST':
        flash("Data Inserted Succesfully")
        no = request.form['no']
        val = request.form['val']
        ket = request.form['ket']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO matrixkeputusan (idmatrix, matrix, keterangan) VALUE (%s, %s, %s)", (no, val, ket))
        mysql.connection.commit()
        return redirect(url_for('matrix'))

@app.route('/matrix/update', methods=['POST', 'GET'])
def matrix_update():
    if request.method == 'POST':
        no = request.form['no']
        val = request.form['val']
        ket = request.form['ket']

        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE matrixkeputusan
        SET matrix=%s, ket=%s
        WHERE idmatrix = %s
        """, (val, ket, no))
        flash("Data Updated Succesfully")
        mysql.connection.commit()
        return redirect(url_for('matrix'))

@app.route('/matrix/delete/<string:id>', methods=['GET'])
def matrix_delete(id):
    flash("Data Deleted Succesfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM matrixkeputusan WHERE idmatrix = %s", (id))
    mysql.connection.commit()
    return redirect(url_for('matrix'))

#View
@app.route('/view')
def view():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM vmatrixkeputusan")
    data = cur.fetchall()
    cur.close()

    cur1 = mysql.connection.cursor()
    cur1.execute("SELECT * FROM vnormalisasi")
    data1 = cur1.fetchall()
    cur1.close()

    cur2 = mysql.connection.cursor()
    cur2.execute("SELECT * FROM vrangking")
    data2 = cur2.fetchall()
    cur2.close()

    cur3 = mysql.connection.cursor()
    cur3.execute("SELECT * FROM wp_normalisasiterbobot")
    data3 = cur3.fetchall()
    cur3.close()
    
    cur4 = mysql.connection.cursor()
    cur4.execute("SELECT * FROM wp_pangkat")
    data4 = cur4.fetchall()
    cur4.close()
    
    cur5 = mysql.connection.cursor()
    cur5.execute("SELECT * FROM topsis_maxmin")
    data5 = cur5.fetchall()
    cur5.close()
    
    cur6 = mysql.connection.cursor()
    cur6.execute("SELECT * FROM topsis_sipsin")
    data6 = cur6.fetchall()
    cur6.close()
    
    cur7 = mysql.connection.cursor()
    cur7.execute("SELECT * FROM topsis_terbobot")
    data7 = cur7.fetchall()
    cur7.close()
    
    cur8 = mysql.connection.cursor()
    cur8.execute("SELECT * FROM multimoora_3")
    data8 = cur8.fetchall()
    cur8.close()
    
    cur9 = mysql.connection.cursor()
    cur9.execute("SELECT * FROM multimoora_4")
    data9 = cur9.fetchall()
    cur9.close()
    
    return render_template('result.html', mat = data, nor = data1, rank = data2, norm_bot = data3, pangkat = data4, t_maxmin = data5, t_sipsin = data6, t_terbobot = data7, moora3 = data8, moora4 = data9 )

if __name__ == '__main__':
    app.run(debug=True)