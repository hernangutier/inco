<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "grupos".
 *
 * @property int $id
 * @property string $descripcion
 * @property string $ref
 * @property int $id_lin
 *
 * @property Lineas $lin
 *
 * @property Productos[] $productos
 */
class Grupos extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'grupos';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ref','descripcion'], 'required'],
            [['id','id_lin'], 'integer'],
            [['descripcion'], 'string', 'max' => 45],
            [['ref'], 'string', 'max' => 3],
            [['ref'], 'unique'],
            [['id_lin'], 'required'],
            [['id'], 'unique'],
            [['id_lin'], 'exist', 'skipOnError' => true, 'targetClass' => Lineas::className(), 'targetAttribute' => ['id_lin' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'descripcion' => 'Decripcion',
            'ref' => 'Ref',
            'id_lin'=>'Linea',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLin()
    {
        return $this->hasOne(Lineas::className(), ['id' => 'id_lin']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductos()
    {
        return $this->hasMany(Productos::className(), ['id_grupo' => 'id']);
    }
}
