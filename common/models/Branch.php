<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "branch".
 *
 * @property int $id
 * @property string $name
 * @property string $branch_no
 * @property string $street
 * @property string $city
 * @property string $postcode
 */
class Branch extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'branch';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['branch_no'], 'required'],
            [['name'], 'string', 'max' => 200],
            [['branch_no', 'postcode'], 'string', 'max' => 10],
            [['street', 'city'], 'string', 'max' => 20],
            [['branch_no'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'branch_no' => 'Branch No',
            'street' => 'Street',
            'city' => 'City',
            'postcode' => 'Postcode',
        ];
    }
}
