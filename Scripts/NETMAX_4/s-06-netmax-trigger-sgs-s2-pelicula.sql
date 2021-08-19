--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Main Triggers

create or replace trigger t_dml_pelicula
instead of insert or update or delete on pelicula
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
        if v_tipo = 'P' then
          insert into pelicula_f1(programa_id,duracion,sinopsis,
          clasificacion,pelicula_antecedente_id)
          values (:new.programa_id, :new.duracion, :new.sinopsis, 
          :new.clasificacion, :new.pelicula_antecedente_id);
        else
          raise_application_error(-20010,
            'Valor incorrecto para el campo padre '
          );
        end if;
      elsif v_count_f1 = 0 and v_count_f2 = 1 and v_count_f3 = 0 then
        select tipo into v_tipo
        from programa_f1 where programa_id = :new.programa_id;
        if v_tipo = 'P' then
          insert into pelicula_f2(programa_id,duracion,sinopsis,
          clasificacion,pelicula_antecedente_id)
          values (:new.programa_id, :new.duracion, :new.sinopsis, 
          :new.clasificacion, :new.pelicula_antecedente_id);
        else
          raise_application_error(-20010,
            'Valor incorrecto para el campo padre TIPO: bería ser tipo pelicula'
          );
        end if;
      elsif v_count_f1 = 0 and v_count_f2 = 0 and v_count_f3 = 1 then
        select tipo into v_tipo
        from programa_f1 where programa_id = :new.programa_id;
        if v_tipo = 'P' then
          insert into pelicula_f3(programa_id,duracion,sinopsis,
          clasificacion,pelicula_antecedente_id)
          values (:new.programa_id, :new.duracion, :new.sinopsis, 
          :new.clasificacion, :new.pelicula_antecedente_id);
        else
          raise_application_error(-20010,
            'Valor incorrecto para el campo padre ser tipo pelicula'
          );
        end if;
      else
        raise_application_error(-20020,
            'Valor incorrecto para el campo FOLIO: combinacione de letras desde AA hasta ZZ'
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
      select count(*) into v_count_f2
      from programa_f3
      where programa_id = :old.programa_id;
    
      if v_count_f1 = 1 and v_count_f2 = 0 and v_count_f3 = 0 then

        delete from pelicula_f1 where programa_id = :old.programa_id;

      elsif v_count_f1 = 0 and v_count_f2 = 1 and v_count_f3 = 0 then

       delete from pelicula_f2 where programa_id = :old.programa_id;

      elsif v_count_f1 = 0 and v_count_f2 = 0 and v_count_f3 = 1 then

       delete from pelicula_f3 where programa_id = :old.programa_id;

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