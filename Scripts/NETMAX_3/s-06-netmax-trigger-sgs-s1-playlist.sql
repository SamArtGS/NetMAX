--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Main Triggers

create or replace trigger t_dml_playlist
instead of insert or update or delete on playlist
declare
  v_count_f2 number;
  v_count_f3 number;
  v_count_f4 number;
  v_count_f5 number;
  v_tipo char;
begin 
  case
    when inserting then

      select count(*) into v_count_f2
      from usuario_f2
      where usuario_id = :new.usuario_id;
      
      select count(*) into v_count_f3
      from usuario_f3
      where usuario_id = :new.usuario_id;

      select count(*) into v_count_f4
      from usuario_f4
      where usuario_id = :new.usuario_id;

      select count(*) into v_count_f5
      from usuario_f5
      where usuario_id = :new.usuario_id;


      if v_count_f2 = 1 and v_count_f3 = 0 and v_count_f4 = 0 and v_count_f5 = 0 then

        insert into playlist_f1(playlist_id,calificacion,indice,num_reproducciones,programa_id,usuario_id)
          values (:new.playlist_id,:new.calificacion,:new.indice,:new.num_reproducciones,:new.programa_id,:new.usuario_id);

      elsif v_count_f2 = 0 and v_count_f3 = 1 and v_count_f4 = 0 and v_count_f5 = 0 then

        insert into playlist_f2(playlist_id,calificacion,indice,num_reproducciones,programa_id,usuario_id)
          values (:new.playlist_id,:new.calificacion,:new.indice,:new.num_reproducciones,:new.programa_id,:new.usuario_id);

      elsif v_count_f2 = 0 and v_count_f3 = 0 and v_count_f4 = 1 and v_count_f5 = 0 then

        insert into playlist_f3(playlist_id,calificacion,indice,num_reproducciones,programa_id,usuario_id)
          values (:new.playlist_id,:new.calificacion,:new.indice,:new.num_reproducciones,:new.programa_id,:new.usuario_id);

      elsif v_count_f2 = 0 and v_count_f3 = 0 and v_count_f4 = 0 and v_count_f5 = 1 then

        insert into playlist_f4(playlist_id,calificacion,indice,num_reproducciones,programa_id,usuario_id)
          values (:new.playlist_id,:new.calificacion,:new.indice,:new.num_reproducciones,:new.programa_id,:new.usuario_id);

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

      select count(*) into v_count_f2
      from usuario_f2
      where usuario_id = :old.usuario_id;
      
      select count(*) into v_count_f3
      from usuario_f3
      where usuario_id = :old.usuario_id;

      select count(*) into v_count_f4
      from usuario_f4
      where usuario_id = :old.usuario_id;

      select count(*) into v_count_f5
      from usuario_f5
      where usuario_id = :old.usuario_id;
    
      if v_count_f2 = 1 and v_count_f3 = 0 and v_count_f4 = 0 and v_count_f5 = 0 then

       delete from playlist_f1 where playlist_id = :old.playlist_id;

      elsif v_count_f2 = 0 and v_count_f3 = 1 and v_count_f4 = 0 and v_count_f5 = 0 then

        delete from playlist_f2 where playlist_id = :old.playlist_id;

      elsif v_count_f2 = 0 and v_count_f3 = 0 and v_count_f4 = 1 and v_count_f5 = 0 then

        delete from playlist_f3 where playlist_id = :old.playlist_id;

      elsif v_count_f2 = 0 and v_count_f3 = 0 and v_count_f4 = 0 and v_count_f5 = 1 then

        delete from playlist_f4 where playlist_id = :old.playlist_id;
        
      else
        raise_application_error(-20020,
            'Valor incorrecto para el campo combinacione de letras desde AA hasta ZZ'
        );
      end if;

    end case;
  exception
   WHEN others THEN
   null;
  end;
/
show errors