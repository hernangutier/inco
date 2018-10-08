<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "vw_lineas".
 *
 * @property int $id
 * @property string $descripcion
 */
class VwLineas extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'vw_lineas';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['descripcion'], 'string', 'max' => 311],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'descripcion' => 'Descripcion',
        ];
    }
}
