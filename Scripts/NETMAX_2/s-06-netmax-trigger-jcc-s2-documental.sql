--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Main Triggers

create or replace trigger t_dml_documental
instead of insert or update or delete on documental
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

        if v_tipo = 'D' then

          insert into ti_documental_1(programa_id,tematica,duracion,trailer,pais_id)
          values (:new.programa_id,:new.tematica,:new.duracion,:new.trailer,:new.pais_id);

          insert into documental_1
          select * from ti_documental_1
          where programa_id = :new.programa_id;

          delete from ti_documental_1
          where programa_id = :new.programa_id;

        else
          raise_application_error(-20010,
            'Valor incorrecto para el campo padre TIPO, Debería ser tipo documental'
          );
        end if;

      elsif v_count_f1 = 0 and v_count_f2 = 1 and v_count_f3 = 0 then

        select tipo into v_tipo
        from programa_f1 where programa_id = :new.programa_id;

        if v_tipo = 'D' then

          insert into ti_documental_2(programa_id,tematica,duracion,trailer,pais_id)
          values (:new.programa_id,:new.tematica,:new.duracion,:new.trailer,:new.pais_id);

          insert into documental_2
          select * from ti_documental_2
          where programa_id = :new.programa_id;

          delete from ti_documental_2
          where programa_id = :new.programa_id;

        else
          raise_application_error(-20010,
            'Valor incorrecto para el campo padre TIPO. Debería ser tipo documental'
          );
        end if;

      elsif v_count_f1 = 0 and v_count_f2 = 0 and v_count_f3 = 1 then

        select tipo into v_tipo
        from programa_f1 where programa_id = :new.programa_id;

        if v_tipo = 'D' then

          insert into ti_documental_3(programa_id,tematica,duracion,trailer,pais_id)
          values (:new.programa_id,:new.tematica,:new.duracion,:new.trailer,:new.pais_id);

          insert into documental_3
          select * from ti_documental3
          where programa_id = :new.programa_id;

          delete from ti_documental_3
          where programa_id = :new.programa_id;

        else
          raise_application_error(-20010,
            'Valor incorrecto para el campo padre TIPO:'
          );
        end if;

      else
        raise_application_error(-20020,
            'Valor incorrecto para el campo combinacione de letras desde AA hasta ZZ'
        );
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

        delete from documental_f1 where programa_id = :old.programa_id;

      elsif v_count_f1 = 0 and v_count_f2 = 1 and v_count_f3 = 0 then

       delete from documental_f2 where programa_id = :old.programa_id;

      elsif v_count_f1 = 0 and v_count_f2 = 0 and v_count_f3 = 1 then

       delete from documental_f3 where programa_id = :old.programa_id;

      else
        raise_application_error(-20020,
            'Valor incorrecto para fk');
      end if;

    end case;
  end;
/
show errors