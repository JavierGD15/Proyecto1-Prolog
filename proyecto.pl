%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                Javier Alexander Giron Donis              %
%                     0910-24-14006                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%
%  Estudiantes     %
%%%%%%%%%%%%%%%%%%%%
estudiante(juan).
estudiante(maria).
estudiante(pedro).
estudiante(ana).
estudiante(carlos).

%%%%%%%%%%%%%%%%%%%%
%  Carrera         %
%%%%%%%%%%%%%%%%%%%%
% Se asume que todos los estudiantes están inscritos en la
% carrera de ingeniería en sistemas para ejemplificar.
carrera(ingenieria_sistemas).
carrera(derecho).


%%%%%%%%%%%%%%%%%%%%
%  Inscrito        %
%%%%%%%%%%%%%%%%%%%%
inscrito_en(juan, ingenieria_sistemas).
inscrito_en(maria, ingenieria_sistemas).
inscrito_en(pedro, ingenieria_sistemas).
inscrito_en(ana, ingenieria_sistemas).
inscrito_en(carlos, ingenieria_sistemas).

%%%%%%%%%%%%%%%%%%%%
%  Ciclos          %
%%%%%%%%%%%%%%%%%%%%
ciclo(primer_ciclo).
ciclo(segundo_ciclo).
ciclo(tercer_ciclo).
ciclo(cuarto_ciclo).
ciclo(quinto_ciclo).

%%%%%%%%%%%%%%%%%%%%
%  Cursos          %
%%%%%%%%%%%%%%%%%%%%
curso(programacion1).
curso(programacion2).
curso(bases_de_datos).
curso(arquitectura_computadoras).
curso(matematica_discreta).
curso(leyes).


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Asociar curso a Carrera %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
curso_a_carrera(programacion1, ingenieria_sistemas).
curso_a_carrera(programacion2, ingenieria_sistemas).
curso_a_carrera(bases_de_datos, ingenieria_sistemas).
curso_a_carrera(arquitectura_computadoras, ingenieria_sistemas).
curso_a_carrera(matematica_discreta, ingenieria_sistemas).
curso_a_carrera(leyes, derecho).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Pertenencia a Ciclos    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pertenece_a_ciclo(programacion1, primer_ciclo).
pertenece_a_ciclo(programacion2, segundo_ciclo).
pertenece_a_ciclo(bases_de_datos, tercer_ciclo).
pertenece_a_ciclo(arquitectura_computadoras, cuarto_ciclo).
pertenece_a_ciclo(matematica_discreta, segundo_ciclo).

%%%%%%%%%%%%%%%%%%%%
%   Horarios       %
%%%%%%%%%%%%%%%%%%%%
horario(programacion1, '8am-10am').
horario(programacion2, '10am-12pm').
horario(bases_de_datos, '2pm-4pm').
horario(arquitectura_computadoras, '4pm-6pm').
horario(matematica_discreta, '10am-12pm').  

%%%%%%%%%%%%%%%%%%%%
%  Prerrequisitos  %
%%%%%%%%%%%%%%%%%%%%
requisito(programacion2, programacion1).
requisito(bases_de_datos, programacion1).
requisito(matematica_discreta, programacion1).
requisito(arquitectura_computadoras, programacion2).
requisito(arquitectura_computadoras, bases_de_datos).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Solvencia (pagado / no pagado)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Se interpreta como que el estudiante está solvente en el curso
% (lo ha pagado) para poderlo llevar.
solvente(juan, programacion1).
solvente(juan, programacion2).
solvente(maria, programacion1).
solvente(pedro, bases_de_datos).
solvente(ana, arquitectura_computadoras).

%%%%%%%%%%%%%%%%%%%%%%%%
%   Inscripción en curso
%%%%%%%%%%%%%%%%%%%%%%%%
% Se indica que estos estudiantes están actualmente inscritos 
% en estos cursos.
asignado_a(juan, programacion1).
asignado_a(juan, programacion2).
asignado_a(maria, programacion1).
asignado_a(pedro, bases_de_datos).
asignado_a(carlos, matematica_discreta).

%%%%%%%%%%%%%%%%%%%%
%   Aprobaciones   %
%%%%%%%%%%%%%%%%%%%%
% El estudiante ya aprobó el curso.
aprobado(juan, programacion1).
aprobado(pedro, programacion1).
aprobado(ana, programacion1).
aprobado(maria, programacion1).
aprobado(ana, programacion2).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Reglas                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Regla para saber en qué ciclos lleva cursos un estudiante
% Uso:
%    ?- ciclo_estudiante(Estudiante, Ciclo).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ciclo_estudiante(Estudiante, Ciclo) :-
    asignado_a(Estudiante, Curso),
    pertenece_a_ciclo(Curso, Ciclo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Regla para listar estudiantes que tienen cursos en el mismo
% horario. Retorna pares (Est1, Est2) donde Est1 y Est2 están
% asignados a cursos con el mismo horario.
% Uso:
%    ?- mismo_horario(Est1, Est2).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mismo_horario(Est1, Est2) :-
    asignado_a(Est1, Curso1),
    asignado_a(Est2, Curso2),
    horario(Curso1, H),
    horario(Curso2, H),
    Est1 \= Est2.

