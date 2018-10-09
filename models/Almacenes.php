<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "almacenes".
 *
 * @property int $id
 * @property string $ref
 * @property string $descripcion
 *
 * @property Ubicaciones[] $ubicaciones
 */
class Almacenes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'almacenes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ref', 'descripcion'], 'required'],
            [['ref'], 'string', 'max' => 10],
            [['descripcion'], 'string', 'max' => 200],
            [['ref'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ref' => 'Ref',
            'descripcion' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUbicaciones()
    {
        return $this->hasMany(Ubicaciones::className(), ['id_alm' => 'id']);
    }
}
