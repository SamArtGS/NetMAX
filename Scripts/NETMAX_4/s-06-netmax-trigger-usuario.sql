--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de trigger DLL para usuario

create or replace trigger t_dml_usuario
instead of insert or update or delete on usuario
declare
begin 
  case
    when inserting then
      if :new.vigente = '0' then
        
      insert into usuario_f2(usuario_id,email,nombre,ap_paterno,
      ap_materno,fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
      values(:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno,
      :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);

      elsif :new.vigente = '1' then
        if :new.tipo_cuenta_id = '1' then

          insert into usuario_f3(usuario_id,email,nombre,ap_paterno,
            ap_materno,fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
          values(:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno,
            :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, 
            :new.vigente, :new.tipo_cuenta_id);

        elsif :new.tipo_cuenta_id = '2' then
          
          insert into usuario_f4(usuario_id,email,nombre,ap_paterno,
            ap_materno,fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
          values(:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno,
            :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, 
            :new.vigente, :new.tipo_cuenta_id);

        elsif :new.tipo_cuenta_id = '3' then
          
          insert into usuario_f5(usuario_id,email,nombre,ap_paterno,
            ap_materno,fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
          values(:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno,
            :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, 
            :new.vigente, :new.tipo_cuenta_id);
        else
          raise_application_error(-20010,
          'Valor incorrecto para el campo TIPO_CUENTA_ID: '
          ||:new.tipo_cuenta_id
          ||' Solo se permiten valores 1,2,3'
          );
        end if;

        -- INSERCIÓN DE PASSWORD Y TARJETA EN NODO 1
        insert into usuario_f1(usuario_id,num_tarjeta,password)
        values(:new.usuario_id, :new.num_tarjeta, :new.password);

      else
        raise_application_error(-20010,
        'Valor incorrecto para el campo VIGENTE: '
        ||:new.vigente
        ||' Solo se permiten valores 0 o 1'
        );
      end if;

    when updating then
      raise_application_error(-20030,
        'Operación UPDATE no soportada aún'
      );

    when deleting then
        if :old.vigente = '0' then
          
          delete from usuario_f2 where usuario_id = :old.usuario_id; 

        elsif :old.vigente = '1' then
          if :old.tipo_cuenta_id = '1' then
            delete from usuario_f3 where usuario_id = :old.usuario_id; 

          elsif :old.tipo_cuenta_id = '2' then
            delete from usuario_f4 where usuario_id = :old.usuario_id; 

          elsif :old.tipo_cuenta_id = '3' then
            delete from usuario_f5 where usuario_id = :old.usuario_id; 

          else 
            raise_application_error(-20010,
              'Valor incorrecto para el campo tipo_cuenta_id: '
              ||:old.tipo_cuenta_id
              ||' Solo se permiten valores 0 o 1'
            );
          end if;
          delete from usuario_f1 where usuario_id = :old.usuario_id; 
        else
          raise_application_error(-20010,
            'Valor incorrecto para el campo VIGENTE: '
            ||:old.vigente
            ||' Solo se permiten valores 0 o 1'
          );
        end if;
    end case;
  exception
   WHEN others THEN
   null;
  end;
/
show errors