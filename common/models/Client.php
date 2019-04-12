<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "client".
 *
 * @property int $id
 * @property string $client_no
 * @property string $first_name
 * @property string $last_name
 * @property int $telephone
 * @property string $pref_type
 * @property string $max_rent
 */
class Client extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'client';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['client_no'], 'required'],
            [['telephone'], 'integer'],
            [['max_rent'], 'number'],
            [['client_no'], 'string', 'max' => 10],
            [['first_name', 'last_name'], 'string', 'max' => 300],
            [['pref_type'], 'string', 'max' => 50],
            [['client_no'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'client_no' => 'Client No',
            'first_name' => 'First Name',
            'last_name' => 'Last Name',
            'telephone' => 'Telephone',
            'pref_type' => 'Pref Type',
            'max_rent' => 'Max Rent',
        ];
    }
}
