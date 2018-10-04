<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "clientes".
 *
 * @property int $id
 * @property string $cedrif
 * @property string $razon
 * @property string $percent_transport
 * @property int $id_zona
 * @property string $direccion
 *
 * @property Zonas $zona
 * @property ComisionesDt[] $comisionesDts
 */
class Clientes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'clientes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cedrif','razon','id_zona'], 'required'],
            [['percent_transport'], 'number'],
            [['id_zona'], 'integer'],
            [['cedrif'], 'string', 'max' => 20],
            [['razon'], 'string', 'max' => 200],
            [['cedrif'], 'unique'],
             [['direccion'], 'string', 'max' => 400],
            [['id_zona'], 'exist', 'skipOnError' => true, 'targetClass' => Zonas::className(), 'targetAttribute' => ['id_zona' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'cedrif' => 'Rif.',
            'razon' => 'Razon Social',
            'percent_transport' => '% Comición Transporte',
            'id_zona' => 'Zona',
             'direccion' => 'Direccion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getZona()
    {
        return $this->hasOne(Zonas::className(), ['id' => 'id_zona']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getComisionesDts()
    {
        return $this->hasMany(ComisionesDt::className(), ['id_client' => 'id']);
    }
}
