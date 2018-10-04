<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "zonas".
 *
 * @property int $id
 * @property string $ref
 * @property string $denominacion
 * @property string $descripcion
  * @property string $percent

 *
 * @property Clientes[] $clientes
 */
class Zonas extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'zonas';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ref','denominacion','descripcion','percent'], 'required'],
            [['ref'], 'string', 'max' => 3],
            [['denominacion'], 'string', 'max' => 100],
            [['descripcion'], 'string', 'max' => 45],
            [['ref'], 'unique'],
            [['percent'], 'number'],
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
            'denominacion' => 'Denominacion',
            'descripcion' => 'Descripcion',
            'percent'=>'% de Comision Transporte',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClientes()
    {
        return $this->hasMany(Clientes::className(), ['id_zona' => 'ref']);
    }
}
