<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%staff}}`.
 */
class m190412_161625_create_staff_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%staff}}', [
            'id' => $this->primaryKey(),
            'staff_no' => $this->string(10)->notNull()->unique(),
            'first_name' => $this->string(20)->notNull(),
            'last_name' => $this->string(20)->notNull(),
            'position' => $this->string(20),
            'sex' => $this->string(1),
            'dob' => $this->date(),
            'salary' => $this->decimal(),
            'branch_id' => $this->string(10)->notNull()
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%staff}}');
    }
}
