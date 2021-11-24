const { query } = require('express');
const express = require('express');
const router = express.Router();
const conn = require('../database');

router.get('/', (req, res, next) => {
    res.render('front/home');
});
  

router.get('/user', (req, res) => {
    conn.query('select * from afiliado join cuenta on afiliado.RUT = cuenta.rut_afiliado join afp on afp.nombre = afiliado.nombre_afp where rut = 20479539', (err, result) => {
      if(!err) {
          res.render('front/user',{
            data: result[0]
          });
        } else {
          console.log(err);
        }
    });
  });

router.post('/solicitarRetiro',(req, res) => {
    const {porcentaje, tipo_cuenta_retiro, RUT_afiliado} = req.body;
    var _saldo = req.body.saldo;
    var fecha = new Date();
    var monto = _saldo* (porcentaje/100);
    
    conn.query('INSERT into solicitud_retiro SET ? ',{
        fecha: fecha,
        porcentaje: porcentaje,
        monto: monto,
        estado: 'pendiente',
        tipo_cuenta_retiro: tipo_cuenta_retiro,
        RUT_afiliado: RUT_afiliado
    }, (err, result) => {
        if(err) {
            console.log(err);
        }
        res.redirect('/user');
    });
  });

conn.query('select concat(primer_apellido," ",primer_nombre) as Nombre, sum(monto) as total_retirado from (afiliado join solicitud_retiro on rut = rut_afiliado and estado = "aceptada") group by rut_afiliado having count(*) = 1 order by primer_apellido desc;',(err, resp, campos) =>{
  console.log(resp)
});
module.exports = router;