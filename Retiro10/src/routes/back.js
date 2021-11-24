const { query } = require('express');
const express = require('express');
const router = express.Router();
const conn = require('../database');

router.get('/solicitudes', (req, res) => {
    conn.query("select * from solicitud_retiro join afiliado on solicitud_retiro.rut_afiliado = afiliado.RUT where estado = 'pendiente'", (err, result) => {
      if(!err) {
        res.render('back/solicitudes',{
          data: result
        });
      } else {
        console.log(err);
      }
  });
  });
  
  router.get('/afiliados', (req, res, next) => {
    conn.query('select * from afiliado', (err, result) => {
      if(!err) {
        res.render('back/mostrar',{
          data: result
        });
      } else {
        console.log(err);
      }
  });
  });

  

  
  //Eliminar afiliado
  router.get('/delete/:RUT', (req, res) => {
    const { RUT } = req.params;
    conn.query('SET FOREIGN_KEY_CHECKS=0;'); 
    conn.query('DELETE FROM afiliado WHERE RUT = ?', [RUT]);
    res.redirect('/afiliados');
  });
  
  //Añadir afiliado
  router.post('/add',(req, res) => {
    const { RUT, n_documento, email, pass, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, nombre_afp } = req.body;
    conn.query('INSERT into afiliado SET ? ',{
        RUT: RUT,
        n_documento: n_documento,
        email: email,
        pass: pass,
        primer_nombre: primer_nombre,
        segundo_nombre: segundo_nombre,
        primer_apellido: primer_apellido,
        segundo_apellido: segundo_apellido,
        nombre_afp: nombre_afp
    }, (err, result) => {
        if(err) {
            console.log(err);
        }
        res.redirect('/afiliados');
    });
  });
  
  
  //Solicitudes
  router.post('/aceptarSolicitud', (req, res) => {
    const { RUT_afiliado, id_retiro, monto} = req.body;
    conn.query("update solicitud_retiro set estado = 'aceptada' where id_retiro =  ?",id_retiro, (err, result) => {
    });
    conn.query("update cuenta set saldo = saldo - ? where RUT_afiliado = ?",[monto, RUT_afiliado], (err, result) => {
      res.redirect('/solicitudes');
    });
  });
  
  router.get('/denegarSolicitud/:id_retiro', (req, res) => {
    const { id_retiro} = req.params;  
    conn.query("update solicitud_retiro set estado = 'rechazada' where id_retiro =  ?",[id_retiro], (err, result) => {
        res.redirect('/solicitudes');
    });
  });
  
  //Update
  router.get('/edit', function (req, res, next) {
    conn.query('select * from afiliado where rut = ?', req.query.RUT, function (err, rs){
      res.render('back/update', {book: rs[0]});
    })
  })
  
  router.post('/edit', function (req, res, next) {
    var param = [
      req.body,
      req.body.RUT
    ]
    conn.query('update afiliado set ? where RUT = ?', param, function(err, rs){
      res.redirect('/afiliados')
    })
  })
  module.exports = router;