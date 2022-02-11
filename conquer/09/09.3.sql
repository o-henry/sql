SELECT name, salary FROM tEmployee WHERE name = (SELECT employee FROM tProject WHERE project = '노조 협상건');


