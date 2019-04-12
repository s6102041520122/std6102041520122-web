<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "staff".
 *
 * @property int $id
 * @property string $staff_no
 * @property string $first_name
 * @property string $last_name
 * @property string $position
 * @property string $sex
 * @property string $dob
 * @property string $salary
 * @property string $branch_id
 */
class Staff extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'staff';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['staff_no', 'first_name', 'last_name', 'branch_id'], 'required'],
            [['dob'], 'safe'],
            [['salary'], 'number'],
            [['staff_no', 'branch_id'], 'string', 'max' => 10],
            [['first_name', 'last_name', 'position'], 'string', 'max' => 20],
            [['sex'], 'string', 'max' => 1],
            [['staff_no'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'staff_no' => 'Staff No',
            'first_name' => 'First Name',
            'last_name' => 'Last Name',
            'position' => 'Position',
            'sex' => 'Sex',
            'dob' => 'Dob',
            'salary' => 'Salary',
            'branch_id' => 'Branch ID',
        ];
    }
}
