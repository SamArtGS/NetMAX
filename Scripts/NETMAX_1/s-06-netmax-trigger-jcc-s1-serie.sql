--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Main Triggers

create or replace trigger t_dml_serie
instead of insert or update or delete on serie
declare
  v_count_f1 number;
  v_count_f2 number;
  v_count_f3 number;
  v_tipo char;
begin 
  case
    when inserting then
      select count(*) into v_count_f1
      from programa_f1
      where programa_id = :new.programa_id;
      
      select count(*) into v_count_f2
      from programa_f2
      where programa_id = :new.programa_id;

      select count(*) into v_count_f3
      from programa_f3
      where programa_id = :new.programa_id;


      if v_count_f1 = 1 and v_count_f2 = 0 and v_count_f3 = 0 then

        select tipo into v_tipo
        from programa_f1 where programa_id = :new.programa_id;

        if v_tipo = 'S' then

          insert into serie_f1(programa_id,num_capitulos,duracion_capitulo,
          tipo_serie_id)
          values (:new.programa_id, :new.num_capitulos, :new.duracion_capitulo, 
          :new.tipo_serie_id);
        
        else
          raise_application_error(-20010,
            'Valor incorrecto para el campo padre'
          );
        end if;

      elsif v_count_f1 = 0 and v_count_f2 = 1 and v_count_f3 = 0 then

        select tipo into v_tipo
        from programa_f1 where programa_id = :new.programa_id;

        if v_tipo = 'S' then

          insert into serie_f2(programa_id,num_capitulos,duracion_capitulo,
          tipo_serie_id)
          values (:new.programa_id, :new.num_capitulos, :new.duracion_capitulo, 
          :new.tipo_serie_id);

        else
          raise_application_error(-20010,
            'Valor incorrecto para el campo pad'
          );
        end if;

      elsif v_count_f1 = 0 and v_count_f2 = 0 and v_count_f3 = 1 then

        select tipo into v_tipo
        from programa_f1 where programa_id = :new.programa_id;

        if v_tipo = 'S' then
          insert into serie_f3(programa_id,num_capitulos,duracion_capitulo,
          tipo_serie_id)
          values (:new.programa_id, :new.num_capitulos, :new.duracion_capitulo, 
          :new.tipo_serie_id);
        else
          raise_application_error(-20010,
            'Valor incorrecto para el cam'
          );
        end if;

      else
        raise_application_error(-20020,
            'Valor incorrecto para el campo FOLIO: ');
      end if;

    when updating then
      raise_application_error(-20030,
        'Operación UPDATE no soportada aún'
      );

    when deleting then

      select count(*) into v_count_f1
      from programa_f1
      where programa_id = :old.programa_id;
      
      select count(*) into v_count_f2
      from programa_f2
      where programa_id = :old.programa_id;

      select count(*) into v_count_f3
      from programa_f3
      where programa_id = :old.programa_id;
    
      if v_count_f1 = 1 and v_count_f2 = 0 and v_count_f3 = 0 then

        delete from serie_f1 where programa_id = :old.programa_id;

      elsif v_count_f1 = 0 and v_count_f2 = 1 and v_count_f3 = 0 then

       delete from serie_f2 where programa_id = :old.programa_id;

      elsif v_count_f1 = 0 and v_count_f2 = 0 and v_count_f3 = 1 then

       delete from serie_f3 where programa_id = :old.programa_id;

      else
        raise_application_error(-20020,
            'Valor incorrecto para el campo '
        );
      end if;

    end case;
  exception
   WHEN others THEN
   null;
  end;
/
show errors