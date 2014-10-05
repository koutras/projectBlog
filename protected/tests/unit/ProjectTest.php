<?php
class ProjectTest extends CDbTestCase
{

    //mapping fictures named project to model class Project
    public $fixtures=array
    (
        'projects'=>'Project',
    );

        public function testCreate(){
            //Create a new project
            $newProject = new Project;
            $newProjectName = "Test Project 1";
            $newProject-> setAttributes(
                array(
                        'name' => $newProjectName,
                        'description' => 'Test project number one',
                        'create_time' => '2010-01-01 00:00:00',
                        'create_user_id' => 1,
                        'update_time' => '2010-01-01 00:00:00',
                        'update_user_id' => 1,
                )
            );
            $this->assertTrue($newProject->save(false));

            //newProject has a new field assigned, and that's the auto incremented key


            //Read back the newly created project
            $retrievedProject = Project::model()->findByPk($newProject->id);
            $this->assertTrue($retrievedProject instanceof Project);
            $this->assertEquals($newProjectName, $retrievedProject->name);
         }

        public function testRead(){
            $retrievedProject = $this->projects('project1'); 
            $this->assertTrue($retrievedProject instanceof Project);
            $this->assertEquals('Test Project 1', $retrievedProject->name);
        }

        public function testUpdate()
        {   //I was bored ..
            $project = $this;
        
        }
    

        public function testDelete()
        {

        //Delete the project
        $project =$this->projects('project2');
        $savedProjectId = $project->id;
        $this->assertTrue($project->delete());
        $deletedProject = Project::model()->findByPk($savedProjectId);
        $this->assertEquals(NULL, $deletedProject);
        //the deletedProject variable is NULL as the project is deleted
        }


        public function testFictures()
        {
            //use fictures
            $project = $this->projects;
            //return the row
            $projectOne = $this->projects['project1'];
            
           //return the INSTANCE!!
            $project = $this->projects('project1');
        }


}
?>
